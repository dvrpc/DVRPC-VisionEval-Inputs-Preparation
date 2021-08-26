import json
import urllib.request as urlr

from geopandas.geodataframe import GeoDataFrame
from src.helpers.database import Database
import pandas as pd
import geopandas as gpd
from shapely.geometry import shapely 
from src.helpers.environment_variables import DATABASE_URL, SUPERUSER_DATABASE_URL

def download_epa_sld_data_as_geojson(filepath:str):
    """
    - This function downloads a geojson from the EPA's Smart Location Database
    - It uses a loop to iterate over all features in the table, which gets around
    the issue of the EPA rest service not allowing all of the features to be queried at once
    """

    # set variables for map service
    # map service url
    mapservice = (
        r"https://geodata.epa.gov/arcgis/rest/services/OA/SmartLocationDatabase/MapServer/15/"
    )
    # map service query
    query = r'query?where=GEOID10+like+%2734005%25%27+or+GEOID10+like+%2734007%25%27+or+GEOID10+like+%2734015%25%27+or+GEOID10+like+%2734021%25%27'

    # geojson structure
    dict = '{"type": "FeatureCollection"}'
    geojson = json.loads(dict)
    geojson["features"] = []

    # find total records allowed to be queried from the mapservice
    maxurl = mapservice + r"?f=json"
    response = urlr.urlopen(maxurl)
    maxjson = json.load(response)
    maxcount = int(maxjson["maxRecordCount"])

    # query all objectids, count total objectids
    oidurl = mapservice + query + r"&returnIdsOnly=true&f=json"
    print(oidurl)

    response = urlr.urlopen(oidurl)
    print(response)
    oidjson = json.load(response)
    print(oidjson) 
    idfield = oidjson["objectIdFieldName"]
    print(idfield)
    idlist = oidjson["objectIds"]
    idlist.sort()
    numrec = len(idlist)

    # iterate through map service objectids by max record count
    for i in range(0, numrec, maxcount):
        torec = i + (maxcount - 1)
        if torec > numrec:
            torec = numrec - 1
        fromid = idlist[i]
        toid = idlist[torec]
        where = r"{}+%3E%3D+{}+and+{}+%3C%3D+{}".format(idfield, fromid, idfield, toid)
        # possible to adjust api parameters here to request only specified field (outfields) or even change projection (outsr)
        urlstring = (
            mapservice
            + "query?where={}&outfields=*&outsr=4326&returnGeometry=true&f=geojson".format(where)
        )
        response = urlr.urlopen(urlstring)
        testjson = json.load(response)
        for feature in testjson["features"]:
            # append each feature to geojson dict
            geojson["features"].append(feature)

    # write final geojson to location on hard drive
    file_path = r"/Users/fakram/Downloads/SLD.geojson"

    with open(file_path, "w") as outfile:
        json.dump(geojson, outfile)

    return file_path

if __name__ == "__main__":
    db = Database()

    print("-" * 80)
    print("Importing data from SLD/Map Service")
    print("-" * 80)

            
    filepath = download_epa_sld_data_as_geojson("./SLD.geojson")
    gdf = gpd.read_file(filepath)
    explodedgdf = gdf.explode()
    db.import_geodataframe(explodedgdf, new_tablename="sld", schema="extract")


