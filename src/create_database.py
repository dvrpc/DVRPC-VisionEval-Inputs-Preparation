from src.environment_variables import DATABASE_URL
from src.database import Database
from src.get_data_from_DVRPC_portal import import_data_from_DVRPC_portal


# You can list out any options available here: https://arcgis.dvrpc.org/portal/rest/services
# Take care to match spelling and capitalization from the webpage!

DVRPC_DATA_TO_COPY = [
    ("Boundaries", ["MunicipalBoundaries"]),
    ("Demographics", ["IPD_2018", "LimitedEngProficiencyPUMA_2017", "LimitedEnglishProficiency_2017"])
    
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
    
    #Generate a lookup table that matches BlockGrp IDs to PUMA IDs
    
    db.execute(
        """
        create table if not exists bzone_to_azone as (
            select 
                b.geoid10 as bzone_id,
                p.geoid10 as azone_id
            from raw.limitedenglishproficiency_2017 b , raw.limitedengproficiencypuma_2017 p 
            where st_contains(p.geom, st_centroid(b.geom))
            order by azone_id desc
            )
        
        """
    )
    print("Done")
