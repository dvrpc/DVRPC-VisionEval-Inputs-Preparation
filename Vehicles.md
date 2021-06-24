# azone_charging_availability.csv

This file has data on proportion of different household types who has EV charging available and is used in the AssignHHVehiclePowertrain module.

- ask Rob from Energy and CC 

This file is used to specify the carbon intensity of electricity and is optional (only needed if user wants to modify the values). 

The file is used in Initialize (VEPowertrainsAndFuels) and CalculateCarbonIntensity modules.

![image](https://user-images.githubusercontent.com/85887330/122805356-00c90200-d297-11eb-8e08-0f05a790ed3b.png)

[See Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#assignhhvehiclepowertrain)

# azone_fuel_power_cost.csv 

This file supplies data for retail cost of fuel and electricity and is used in the CalculateVehicleOperatingCost module.
- locate fuel retail costs
- ask Rob from Energy and CC 

[See Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#calculatevehicleoperatingcost)


# azone_hh_veh_mean_age.csv 

This file provides inputs for mean auto age and mean light truck age and is used in the AssignVehicleAge module.

![image](https://user-images.githubusercontent.com/85887330/122809238-d594e180-d29b-11eb-8e26-5cb0d587dce0.png)


# azone_hh_veh_own_taxes.csv 

This file provides inputs for flat fees/taxes (i.e. annual cost per vehicle) and ad valorem taxes (i.e. percentage of vehicle value paid in taxes). The file is used in CalculateVehicleOwnCost module.

- Contact DOT

![image](https://user-images.githubusercontent.com/85887330/122964279-13097580-d355-11eb-9c5b-d20f94d2117c.png)

[See Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#calculatevehicleoperatingcost)


# azone_lttrk_prop.csv 

This file specifies the light truck proportion of the vehicle fleet and is used in AssignVehicleType module.

- Contact Rob from Energy & CC
- Contact DOT (see https://www.dmv.pa.gov/VEHICLE-SERVICES/Title-Registration/Pages/Fleet.aspx)

![image](https://user-images.githubusercontent.com/85887330/122815694-ca45b400-d2a3-11eb-9260-5898b704e29c.png)

[See Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#assignvehicletype)


# azone_veh_use_taxes.csv

This file supplies data for vehicle related taxes and is used in the CalculateVehicleOperatingCost module.
- Locate info in VRTs for A-zone using data from DOT 

![image](https://user-images.githubusercontent.com/85887330/122821773-40014e00-d2ab-11eb-9b30-e5369a5c5ae0.png)

[See Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#calculatevehicleoperatingcost)

# azone_vehicle_access_times.csv 

This file supplies data for vehicle access and egress time and is used in the CalculateVehicleOperatingCost module.

- Egress: time is takes to exit vehicle

![image](https://user-images.githubusercontent.com/85887330/122964808-a2168d80-d355-11eb-883a-b56012a04608.png)

[See Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#calculatevehicleoperatingcost)


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


# region_hvytrk_powertrain_prop.csv

This file is used to specify the powertrain proportion of heavy duty trucks and is optional. The file is used in the Initialize 
(VEPowertrainsAndFuels) and CalculateComEnergyAndEmissions modules.

![image](https://user-images.githubusercontent.com/85887330/122955418-19482380-d34e-11eb-9939-14003b3e8f15.png)

- Contact DOT

[See Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#user-input-files-36)
