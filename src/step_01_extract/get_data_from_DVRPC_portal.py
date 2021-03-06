import requests
from shapely.geometry import shape
import pandas as pd
import geopandas as gpd

from src.helpers.database import Database


def import_data_from_DVRPC_portal(download_list: list):
    """
    - Download starter data via public ArcGIS API using wget

    - The 'download_list' should be formatted as shown below, being a
    list of tuples. Each tuple has two items, the first being the data's schema
    and the second being a list of all tables within the schema to download. This
    could be one or many tables from each schema.

    download_list = [
        ("Boundaries", ["MunicipalBoundaries"]),
        ("Demographics", ["IPD_2018"]),
    ]

    """

    db = Database()

    print("-" * 80)
    print("Importing data from DVRPC's ArcGIS Portal")
    print("-" * 80)

    for schema, table_list in download_list:
        for tbl in table_list:
            print(f"\t-> Importing {schema}.{tbl}")
            url = f"https://arcgis.dvrpc.org/portal/services/{schema}/{tbl}/MapServer/WFSServer?request=GetFeature&service=WFS&typename={tbl}&outputformat=GEOJSON&format_options=filename:{tbl.lower()}.geojson"

            gdf = gpd.read_file(url)

            db.import_geodataframe(gdf, new_tablename=tbl.lower(), schema="extract")
