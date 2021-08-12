from src.step_01_extract.initial_database_creation import create_database
from src.step_01_extract.get_data_from_DVRPC_portal import import_data_from_DVRPC_portal
from src.step_01_extract.urbansimh5 import load_h5_file

from src.step_02_transform.generate_tables import transform_tables

from src.step_03_load.save_csvs import save_csv_files

if __name__ == "__main__":

    print("-" * 80)
    print("Standing up the analysis database")
    print("-" * 80)

    # Make sure the database exists and is ready for postgis
    create_database()

    # EXTRACT
    # -------

    # Import data from DVRPC's ArcGIS Portal
    # ... You can list out any options available here: https://arcgis.dvrpc.org/portal/rest/services
    # ... Take care to match spelling and capitalization from the webpage!
    dvrpc_gis_tables = [
        ("Boundaries", ["MunicipalBoundaries"]),
        (
            "Demographics",
            ["IPD_2018", "LimitedEngProficiencyPUMA_2017", "LimitedEnglishProficiency_2017"],
        ),
    ]

    import_data_from_DVRPC_portal(dvrpc_gis_tables)

    # Import urbansim h5 data
    # To Do: move this filepath from Fiza's computer into the project's google drive folder
    urbansim_h5_filepath = "/Users/fakram/Downloads/results_dvrpc_run_335_run_results.h5"
    load_h5_file(urbansim_h5_filepath)

    # To Do: wire up Sean's code that saves data from EPA's SLD (see 'mapservice_to_geojson.py')

    # TRANSFORM
    # ---------

    transform_tables()

    # LOAD
    # ----

    # To Do: determine where you want outputs saved, ideally within a shared google drive folder
    output_folder = "."
    save_csv_files(output_folder)

    print("Done")
