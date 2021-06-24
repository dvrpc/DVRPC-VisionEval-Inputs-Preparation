# bzone_unprotected_area.csv

This file contains the information about unprotected (i.e., developable) area within the zone and is used in the Calculate4DMeasures module.

![image](https://user-images.githubusercontent.com/85887330/122823760-c028b300-d2ad-11eb-930a-5aebe317c93b.png)

[See Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#calculate4dmeasures)


# bzone_urban-mixed-use_prop.csv

This file contains the target proportion of households located in mixed-used neighborhoods in zone and is used in the CalculateUrbanMixMeasure module.

![image](https://user-images.githubusercontent.com/85887330/122823654-a1c2b780-d2ad-11eb-9e68-db7a49fa9777.png)

[See Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#user-input-files-8)



# bzone_urban-town_du_proportions.csv 

This file contains proportion of Single-Family, Multi-Family and Group Quarter dwelling units within the urban portion of the zone and is used in the AssignLocTypes module.

![image](https://user-images.githubusercontent.com/85887330/122951213-1d267680-d34b-11eb-9297-a943b68c69e0.png)

[See Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#assignloctypes)


# marea_base_year_dvmt.csv 

![image](https://user-images.githubusercontent.com/85887330/122965840-a55e4900-d356-11eb-89b3-1208ce3828cd.png)

[See Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#initialize-vetravelperformance)

- Use Units in Structure table to identify dwelling type proportions for Philadelphia County, PA in ACS
https://data.census.gov/cedsci/table?q=Philadelphia%20dwelling%20units&tid=ACSSE2019.K202504 

This file is used to specify to adjust the dvmt growth factors and is optional (only needed if user wants to modify the values). The file is used in the Initialize (VETravelPerformance), CalculateBaseRoadDvmt and CalculateFutureRoadDvmt modules.


# marea_operations_deployment.csv 

This file is used to specify the proportion of dvmt affected by operations for different road classes and is optional. 

The file is used in the Initialize (VETravelPerformance) and CalculateRoadPerformance modules.

[See Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#calculateroadperformance)

# bzone_lat_lon.csv 

This file contains the latitude and longitude of the centroid of the zone and is used in the LocateEmployment module.

![image](https://user-images.githubusercontent.com/85887330/122843893-78665380-d2ce-11eb-930f-5127e908f2e2.png)

[See Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#locateemployment)

