from src.environment_variables import DATABASE_URL
from src.database import Database
from src.get_data_from_DVRPC_portal import import_data_from_DVRPC_portal


# You can list out any options available here: https://arcgis.dvrpc.org/portal/rest/services
# Take care to match spelling and capitalization from the webpage!

DVRPC_DATA_TO_COPY = [
    ("Boundaries", ["MunicipalBoundaries"]),
    ("Demographics", ["IPD_2018"]),
]

if __name__ == "__main__":

    print("-" * 80)
    print("Standing up the analysis database")
    print("-" * 80)

    db = Database()

    # Create the database if it doesn't exist yet
    if not db.exists():
        db.execute(f"CREATE DATABASE {db.db_name};", autocommit=True)

    # Make sure the PostGIS extension is loaded in the new database
    db.execute(f"CREATE EXTENSION IF NOT EXISTS postgis")

    # Import data from DVRPC's ArcGIS Portal
    import_data_from_DVRPC_portal(db, download_list=DVRPC_DATA_TO_COPY)

    print("Done")
