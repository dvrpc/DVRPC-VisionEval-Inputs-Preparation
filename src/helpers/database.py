from __future__ import annotations
import os
import pandas as pd
import geopandas as gpd
import sqlalchemy
import psycopg2
from geoalchemy2 import Geometry, WKTElement

from src.environment_variables import DATABASE_URL, SUPERUSER_DATABASE_URL


class Database:
    """
    Class that handles all PostgreSQL database interactions

    Parameters:
        uri (str): database connection string, e.g. 'postgresql://username:password@localhost:5432/name_of_db'
        super_uri (str): connection string to database cluster owner (necessary to create a new database)
    """

    def __init__(self, uri: str = DATABASE_URL, super_uri: str = SUPERUSER_DATABASE_URL):
        self.uri = uri
        self.super_uri = super_uri
        self.db_name = uri.split(r"/")[-1]

    def execute(self, query: str, autocommit: bool = False) -> None:
        """
        - Use psycopg2 to execute a query & commit it to the database

        Arguments:
            query (str): the SQL query as a string
            autocommit (bool): flag to execute against the super database as the super user (only necessary for creating a new database)

        Returns:
            None: but executes and commits whatever was contained within the SQL string
        """

        # The autocommit param
        if autocommit:
            connection = psycopg2.connect(self.super_uri)
            connection.set_isolation_level(psycopg2.extensions.ISOLATION_LEVEL_AUTOCOMMIT)
        else:
            connection = psycopg2.connect(self.uri)

        cursor = connection.cursor()

        cursor.execute(query)

        cursor.close()
        connection.commit()
        connection.close()

        return None

    def query(self, query: str, super_uri: bool = False) -> list[tuple]:
        """
        - Use `psycopg2` to run a query and return the result as a list of tuples
        - This will NOT commit any changes to the database

        Arguments:
            query (str): any valid sql query
            super_uri (bool): flag to run against superuser/superdatabase

        Returns:
            list: with each item being a tuple of a result row
        """

        if super_uri:
            uri = self.super_uri
        else:
            uri = self.uri

        connection = psycopg2.connect(uri)
        cursor = connection.cursor()

        cursor.execute(query)

        result = cursor.fetchall()

        cursor.close()
        connection.close()

        return result

    def exists(self) -> bool:
        """
        - This function gives a true or false response if the database exists
        """
        query = f"""
            SELECT EXISTS(
                SELECT datname FROM pg_catalog.pg_database
                WHERE lower(datname) = lower('{self.db_name}')
            );
        """

        return self.query(query, super_uri=True)[0][0]

    def sanitize_df_for_sql(
        self, df: pd.DataFrame | gpd.GeoDataFrame
    ) -> pd.DataFrame | gpd.GeoDataFrame:
        """
        Clean up a dataframe column names so it imports into SQL properly.

        This includes:
            - spaces in column names replaced with underscore
            - all column names are 100% lowercase
            - funky characters are stripped out of column names

        Arguments:
            df (pd.DataFrame | gpd.GeoDataFrame): can be a spatial or nonspatial dataframe

        Returns:
            pd.DataFrame | gpd.GeoDataFrame: a modified version of the input df with the same type
        """

        # Replace "Column Name" with "column_name"
        df.columns = df.columns.str.replace(" ", "_")
        df.columns = [x.lower() for x in df.columns]

        # Remove '.' and '-' from column names.
        # i.e. 'geo.display-label' becomes 'geodisplaylabel'
        for s in [".", "-", "(", ")", "+"]:
            df.columns = df.columns.str.replace(s, "", regex=False)

        return df

    def import_dataframe(
        self, df: pd.DataFrame, tablename: str, df_import_kwargs: dict = {}
    ) -> None:
        """
        - Import an in-memory dataframe to postgres
        - `df_import_kwargs` can include anything accepted by `df.to_sql()` ...
            ... for example: df_import_kwargs={'if_exists': 'replace'}
        """

        # Clean up column names
        df = self.sanitize_df_for_sql(df)

        # Make sure the schema exists
        if "." in tablename:
            schema, tbl = tablename.split(".")
            self.execute(f"CREATE SCHEMA IF NOT EXISTS {schema};")
        else:
            schema = "public"
            tbl = tablename

        # Write to database
        engine = sqlalchemy.create_engine(self.uri)

        df.to_sql(tbl, engine, schema=schema, **df_import_kwargs)

        engine.dispose()

    def import_geodataframe(
        self, gdf: gpd.GeoDataFrame, new_tablename: str, schema: str = "raw"
    ) -> None:
        """
        - Import an in-memory geodataframe into PostGIS, using the specified table and schema names
        - The schema gets created if it does not already exist

        Arguments:
            gdf (gpd.GeoDataFrame): GIS data to import
            new_tablename (str): name of the new table
            schema (str): name of the schema to put the new table into

        Returns:
            None: but creates a new table within the Postgres db
        """

        # Make sure the target schema exists
        self.execute(f"CREATE SCHEMA IF NOT EXISTS {schema}")

        gdf = self.sanitize_df_for_sql(gdf)

        epsg_code = int(str(gdf.crs).split(":")[1])

        # Get a list of all geometry types in the dataframe
        geom_types = list(gdf.geometry.geom_type.unique())

        # Make sure that we don't have single-part and multi-part geometries in the same layer
        # Fail early if so. This is something that will mess you up within the database so you
        # need to address it before importing. One workaround is to force an 'explode' of the data
        # which makes all features single-part
        if len(geom_types) > 1:
            print("This table has multiple geometry types:")
            print(f"{geom_types=}")
            print("Update codebase to explode this kind of data")
            return None

        # Use the non-multi version of the geometry
        geom_type_to_use = min(geom_types, key=len).upper()

        # Replace the 'geom' column with 'geometry'
        if "geom" in gdf.columns:
            gdf["geometry"] = gdf["geom"]
            gdf.drop("geom", axis=1, inplace=True)

        # Drop the 'gid' column
        if "gid" in gdf.columns:
            gdf.drop("gid", axis=1, inplace=True)

        # Rename 'uid' to 'old_uid' if it exists in the geodataframe
        if "uid" in gdf.columns:
            gdf[f"old_uid"] = gdf["uid"]
            gdf.drop("uid", axis=1, inplace=True)

        # Build a 'geom' column using geoalchemy2
        # and drop the source 'geometry' column
        gdf["geom"] = gdf["geometry"].apply(lambda x: WKTElement(x.wkt, srid=epsg_code))
        gdf.drop("geometry", axis=1, inplace=True)

        # Ensure that the target schema exists

        # Write geodataframe to SQL database
        engine = sqlalchemy.create_engine(self.uri)
        gdf.to_sql(
            new_tablename,
            engine,
            schema=schema,
            dtype={"geom": Geometry(geom_type_to_use, srid=epsg_code)},
            if_exists="replace",
        )
        engine.dispose()

        # Make sure the resulting table has a spatial index and unique ID column
        queries = [
            f"""
                CREATE INDEX ON {schema}.{new_tablename}
                USING GIST (geom);
            """,
            f"""
                ALTER TABLE {schema}.{new_tablename}
                ADD uid serial PRIMARY KEY;
            """,
        ]

        for query in queries:
            self.execute(query)
