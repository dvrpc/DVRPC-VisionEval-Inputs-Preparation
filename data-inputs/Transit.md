

# bzone_transit_service.csv 

This file supplies the data on relative public transit accessibility and is used in the AssignTransitService module.

![image](https://user-images.githubusercontent.com/85887330/122964964-cb371e00-d355-11eb-8fde-7e55234fa601.png)

D4c: Aggregate frequency of transit service within 0.25 miles of block group boundary per hour during evening peak period (Ref: EPA 2010 Smart Location Database)

# bzone_carsvc_availability.csv 

This file contains the information about level of car service availability and is used in the AssignCarSvcAvailability module.

![image](https://user-images.githubusercontent.com/85887330/122960107-2fa3ae80-d351-11eb-9eb9-3e61b8a9e3d6.png)

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

# region_hh_driver_adjust_prop.csv 

This file specifies the relative driver licensing rate relative to the model estimation data year and is used in the AssignDrivers module.

- Contact DOT

![image](https://user-images.githubusercontent.com/85887330/122956469-071ab500-d34f-11eb-9269-74ba9a33c4e4.png)

[See Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#assigndrivers)
