#Import Data from SLD


import requests
from shapely.geometry import shape
import pandas as pd
import geopandas as gpd
import json
import urllib.request as urlr

from src.database import Database

def import_data_from_DVRPC_portal(db: Database, download_list: list):
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

    print("-" * 80)
    print("Importing data from DVRPC's ArcGIS Portal")
    print("-" * 80)

    
    for schema, table_list in download_list:
        for tbl in table_list:
            print(f"\t-> Importing {schema}.{tbl}")
           # delete ? url = f"https://arcgis.dvrpc.org/portal/services/{schema}/{tbl}/MapServer/WFSServer?request=GetFeature&service=WFS&typename={tbl}&outputformat=GEOJSON&format_options=filename:{tbl.lower()}.geojson"

# set variables for map service
# map service url
            mapservice = r'https://geodata.epa.gov/arcgis/rest/services/OA/SmartLocationDatabase/MapServer/10/'
# map service query
            query = r'query?where=GEOID10+like+%2742%25%27' 
            #build query for D3BPO4 'query

#geojson structure
            dict = '{"type": "FeatureCollection"}'
            geojson = json.loads(dict)
            geojson['features']=[]

# find total records allowed to be queried from the mapservice
            maxurl = mapservice+r'?f=json'
            response = urlr.urlopen(maxurl)
            maxjson = json.load(response)
            maxcount = int(maxjson["maxRecordCount"])

# query all objectids, count total objectids
            oidurl = mapservice+query+r'&returnIdsOnly=true&f=json'
            response = urlr.urlopen(oidurl)
            oidjson = json.load(response)
            idfield = oidjson["d3bpo4"]          # Line to enter input name ?
            idlist = oidjson["objectIds"]           # What gets added here ? 
            idlist.sort()
            numrec = len(idlist)
            
# iterate through map service objectids by max record count
            for i in range(0, numrec, maxcount):
                torec = i + (maxcount - 1)
                if torec > numrec:
                    torec = numrec - 1
                fromid = idlist[i]
                toid = idlist[torec]
                where = r'{}+%3E%3D+{}+and+{}+%3C%3D+{}'.format(idfield, fromid, idfield, toid)
                # possible to adjust api parameters here to request only specified field (outfields) or even change projection (outsr)
                urlstring = mapservice + "query?where={}&outfields=*&outsr=4326&returnGeometry=true&f=geojson".format(where)
                response = urlr.urlopen(urlstring)
                testjson = json.load(response)
                for feature in testjson['features']:
                    # append each feature to geojson dict
                    geojson['features'].append(feature)