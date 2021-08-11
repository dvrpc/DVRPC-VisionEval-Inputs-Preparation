import json
import urllib.request as urlr


def download_epa_sld_data_as_geojson():
    """
    - This function downloads a geojson from the EPA's Smart Location Database
    - It uses a loop to iterate over all features in the table, which gets around
    the issue of the EPA rest service not allowing all of the features to be queried at once
    """

    # set variables for map service
    # map service url
    mapservice = (
        r"https://geodata.epa.gov/arcgis/rest/services/OA/SmartLocationDatabase/MapServer/10/"
    )
    # map service query
    query = r"query?where=GEOID10+like+%2742%25%27"

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
    response = urlr.urlopen(oidurl)
    oidjson = json.load(response)
    idfield = oidjson["objectIdFieldName"]
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
    with open(r"d:\temp\test.geojson", "w") as outfile:
        json.dump(geojson, outfile)
