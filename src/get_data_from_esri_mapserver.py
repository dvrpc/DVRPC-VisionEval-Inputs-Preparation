import os
from pathlib import Path


def import_data_from_portal_with_wget():
    """Download starter data via public ArcGIS API using wget"""

    # Make a wget command for each table
    commands = []

    for schema, table_list in data_to_download:
        for tbl in table_list:
            wget_cmd = f'wget -O {tbl.lower()}.geojson "https://arcgis.dvrpc.org/portal/services/{schema}/{tbl}/MapServer/WFSServer?request=GetFeature&service=WFS&typename={tbl}&outputformat=GEOJSON&format_options=filename:{tbl.lower()}.geojson"'

            commands.append(wget_cmd)

    # # Download GeoJSON data from DVRPC's ArcGIS REST portal
    for cmd in commands:
        os.system(cmd)

    # Import all of the geojson files into the SQL database
    data_folder = Path(".")
