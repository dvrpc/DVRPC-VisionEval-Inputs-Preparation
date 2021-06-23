
# bzone_transit_service.csv 

This file supplies the data on relative public transit accessibility and is used in the AssignTransitService module.

![image](https://user-images.githubusercontent.com/85887330/122964964-cb371e00-d355-11eb-8fde-7e55234fa601.png)

D4c: Aggregate frequency of transit service within 0.25 miles of block group boundary per hour during evening peak period (Ref: EPA 2010 Smart Location Database)

# bzone_carsvc_availability.csv 

This file contains the information about level of car service availability and is used in the AssignCarSvcAvailability module.

![image](https://user-images.githubusercontent.com/85887330/122960107-2fa3ae80-d351-11eb-9eb9-3e61b8a9e3d6.png)

# bzone_dwelling_units.csv

This file contains the number single-family, multi-family and group-quarter dwelling units and is used in the PredictHousing module.

- Can be found using Census Microdata 

![image](https://user-images.githubusercontent.com/85887330/122844004-b6637780-d2ce-11eb-91aa-9aa78a15695c.png)

[See Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#predicthousing)

# bzone_employment.csv 

This file contains the total, retail and service employment by zone and is used in the LocateEmployment module.

![image](https://user-images.githubusercontent.com/85887330/122843962-9e8bf380-d2ce-11eb-9e6c-623445c6971b.png)

- https://data.census.gov/cedsci/table?q=employment%20philadelphia&tid=ACSDP1Y2019.DP03&hidePreview=true 

[See Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#locateemployment)

# bzone_hh_inc_qrtl_prop.csv 

This file contains the proportion of households in 1st, 2nd, 3rd, and 4th quartile of household income and is used in the PredictHousing module.

![image](https://user-images.githubusercontent.com/85887330/122843708-1d346100-d2ce-11eb-939b-051ba1a01c86.png)

[See Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#predicthousing)

- Average Incomes Table: https://data.census.gov/mdat/#/search?ds=ACSPUMS5Y2019&vv=*FINCP&wt=WGTP 

# bzone_lat_lon.csv 

This file contains the latitude and longitude of the centroid of the zone and is used in the LocateEmployment module.

![image](https://user-images.githubusercontent.com/85887330/122843893-78665380-d2ce-11eb-930f-5127e908f2e2.png)

[See Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#locateemployment)

# bzone_network_design.csv 

This file contains the intersection density in terms of pedestrian-oriented intersections having four or more legs per square mile and is used in the Calculate4DMeasures module.

![image](https://user-images.githubusercontent.com/85887330/122965342-15200400-d356-11eb-82a5-19fd50ab11e1.png)

This file contains the intersection density measured by the number of pedestrian-oriented intersections having four or more legs per square mile (Ref: EPA 2010 Smart Location Database).

# bzone_parking.csv 

This file contains the parking information and is used in the AssignParkingRestrictions module.

![image](https://user-images.githubusercontent.com/85887330/122947225-ffa3dd80-d347-11eb-9002-1a28e923640e.png)

[See Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#assignparkingrestrictions)

# bzone_travel_demand_mgt.csv

This file contains the information about workers and households participating in demand management programs and is used in the AssignDemandManagement module.

![image](https://user-images.githubusercontent.com/85887330/122947359-15b19e00-d348-11eb-9c44-e38add779b63.png)

[See Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#assigndemandmanagement)

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

# marea_congestion_charges.csv 

This file is used to specify the charges of vehicle travel for different congestion levels and is optional. The file is used in the Initialize (VETravelPerformance) and CalculateRoadPerformance modules.

- Contact Energy & CC office

![image](https://user-images.githubusercontent.com/85887330/122965957-c4f57180-d356-11eb-86b3-1f689532accb.png)

[See Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#initialize-vetravelperformance)

# marea_dvmt_split_by_road_class.csv 

This file is used to specify the dvmt split for different road classes and is optional. The file is used in the Initialize (VETravelPerformance) and CalculateBaseRoadDvmt modules.

![image](https://user-images.githubusercontent.com/85887330/122953088-7216bc80-d34c-11eb-8ceb-58a7922021ef.png)

[See Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#calculatebaseroaddvmt)

# marea_lane_miles.csv 

This file contains inputs on the numbers of freeway lane-miles and arterial lane-miles and is used in the AssignRoadMiles module.

- Contact DOT

![image](https://user-images.githubusercontent.com/85887330/122962453-6f6b9580-d353-11eb-881c-4b243d0f214f.png)

[See Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#assignroadmiles)

# marea_operations_deployment.csv 

This file is used to specify the proportion of dvmt affected by operations for different road classes and is optional. 

The file is used in the Initialize (VETravelPerformance) and CalculateRoadPerformance modules.

[See Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#calculateroadperformance)

# marea_speed_smooth_ecodrive.csv 

This input file supplies information of deployment of speed smoothing and ecodriving by road class and vehicle type and is used in the CalculateMpgMpkwhAdjustments module.

![image](https://user-images.githubusercontent.com/85887330/122966156-fbcb8780-d356-11eb-89f7-bbfda2c642b8.png)

[See Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#calculatempgmpkwhadjustments)

# marea_transit_ave_fuel_carbon_intensity.csv 

This file is used to specify the average carbon intensity of fuel used by transit and is optional. The file is used in the Initialize (VETravelPerformance) module.

# marea_transit_biofuel_mix.csv 

This file is used to specify the biofuel used by transit and is optional. The file is used in the Initialize (VETravelPerformance) and CalculateCarbonIntensity modules.

# marea_transit_fuel.csv

This file is used to specify the transit fuel proportions and is optional. The file is used in the Initialize (VETravelPerformance) and CalculateCarbonIntensity modules.

# marea_transit_powertrain_prop.csv 

This file is used to specify the mixes of transit vehicle powertrains and is optional. The file is used in the Initialize (VETravelPerformance) and CalculatePtranEnergyAndEmissions modules.

# marea_transit_service.csv

This file contains annual revenue-miles for different transit modes for metropolitan area and is used in the AssignTransitService module.

![image](https://user-images.githubusercontent.com/85887330/122954635-9b841800-d34d-11eb-8d9d-869745f1a8e6.png)

[See Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#assigntransitservice)

# other_ops_effectiveness.csv

This file is used to specify the delay effects of operations in different road classes and is optional (only needed if user wants to modify the values). The file is used in the Initialize (VETravelPerformance) and CalculateRoadPerformance modules.

# region_ave_fuel_carbon_intensity.csv 

This file is used to specify the average carbon density for different vehicle types and is optional (only needed if user wants to modify the values). The file is used in the Initialize (VETravelPerformance) and CalculateCarbonIntensity modules.

# region_base_year_hvytrk_dvmt.csv 

This file is used to specify the heavy truck dvmt for base year and is optional. The file is used in the Initialize (VETravelPerformance), CalculateBaseRoadDvmt and CalculateFutureRoadDvmt modules.

# region_carsvc_powertrain_prop.csv 

This file is used to specify the powertrain proportion of car services and is optional. The file is used in the Initialize (VETravelPerformance), AssignHhVehiclePowertrain and AdjustHhVehicleMpgMpkwh modules.

# region_comsvc_lttrk_prop.csv 

This file supplies data for the light truck proportion of commercial vehicles and is used in the CalculateComEnergyAndEmissions module.

![image](https://user-images.githubusercontent.com/85887330/122955128-ed2ca280-d34d-11eb-8c59-d575217aff4f.png)

[See Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#calculatecomenergyandemissions)

# region_comsvc_powertrain_prop.csv 

This file is used to specify the powertrain proportion of commercial vehicles and is optional. The file is used in the Initialize (VEPowertrainsAndFuels) and CalculateComEnergyAndEmissions modules.

![image](https://user-images.githubusercontent.com/85887330/122957061-9031ec00-d34f-11eb-9c26-33635645aa2d.png)


# region_hh_driver_adjust_prop.csv 

This file specifies the relative driver licensing rate relative to the model estimation data year and is used in the AssignDrivers module.

- Contact DOT

![image](https://user-images.githubusercontent.com/85887330/122956469-071ab500-d34f-11eb-9269-74ba9a33c4e4.png)

[See Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#assigndrivers)

# region_hvytrk_powertrain_prop.csv

This file is used to specify the powertrain proportion of heavy duty trucks and is optional. The file is used in the Initialize 
(VEPowertrainsAndFuels) and CalculateComEnergyAndEmissions modules.

![image](https://user-images.githubusercontent.com/85887330/122955418-19482380-d34e-11eb-9939-14003b3e8f15.png)

- Contact DOT

[See Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#user-input-files-36)

# region_prop_externalities_paid.csv 

This file supplies data for climate change and other social costs and is used in the CalculateVehicleOperatingCost module.

- Contact Energy & CC

PropClimateCostPaid: Proportion of climate change costs paid by users (i.e. ratio of carbon taxes to climate change costs
PropOtherExtCostPaid: Proportion of other social costs paid by users

![image](https://user-images.githubusercontent.com/85887330/122958094-8c529980-d350-11eb-9dc9-77419a3ca3e2.png)

