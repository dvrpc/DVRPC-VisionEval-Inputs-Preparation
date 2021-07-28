# ESRI rest api info
## DVRPC GIS Services
All DVRPC GIS services can be found on our ArcGIS server https://arcgis.dvrpc.org/portal

Browsing through the directories you'll find map services and feature services.  You can query either of these endpoints to return information from each.

## Sample query
To return all county boundaries in the DVRPC region as a geojson start with the county boundary feature service

https://arcgis.dvrpc.org/portal/rest/services/Boundaries/CountyBoundaries/FeatureServer/0

Since we only want to show DVRPC counties and the data includes county boundaries outside of the DVRPC region, we need to use the field ```dvrpc_reg``` and set it's value to 'Yes'

Add ```/query?where=dvrpc_reg='Yes'``` to the service url like so ```https://arcgis.dvrpc.org/portal/rest/services/Boundaries/CountyBoundaries/FeatureServer/0/query?where=dvrpc_reg='Yes'```

Next we need to specify which fields we want to include in the output.  Since we want all fields to show we'll add ```outfields=*```  Adding more parameters to our API request URL requires ```&``` symbol like this ```https://arcgis.dvrpc.org/portal/rest/services/Boundaries/CountyBoundaries/FeatureServer/0/query?where=dvrpc_reg='Yes'&outfields=*```

Finally we'll add our projection we want the output to be in and the format.  Here we'll use ```outsr=4326``` for WGS84 - World Geodetic System 1984 and ```f=geojson``` for our output type.

https://arcgis.dvrpc.org/portal/rest/services/Boundaries/CountyBoundaries/FeatureServer/0/query?where=dvrpc_reg='Yes'&outfields=*&outsr=4326&f=geojson

## ESRI documentation
For more details about the capabilities and spec of using ESRI rest api check out https://developers.arcgis.com/rest/services-reference/enterprise/get-started-with-the-services-directory.htm

# mapservice_to_geojson.py
Use this hacked together script to query ESRI map services that include maxrecord limitations to output to a single geojson file.  The default record return ESRI sets when publishing map services is 1000 records, because of this it's a pain to recover all records of a large service at once.  This script batches the requests to the URL based on the max record count and merges the results.  Comments in the script explain variables to set.
