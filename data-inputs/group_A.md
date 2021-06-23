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


# azone_gq_pop_by_age.csv

This file contains group quarters population estimates/forecasts by age and is used in the CreateHouseholds module.

- Refers to insitutional and non-institutions living quarters (dorms, nursing homes, correctional facilities,etc.)

- design a script that takes UrbanSim Output, aggregates geogrpahy to PUMA and has all the age ranges

[See Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#createhouseholds)

# azone_hh_pop_by_age.csv 

This file contains population estimates/forecasts by age and is used in the CreateHouseholds module.
- Census PUMS
- From UrbanSim Output

![image](https://user-images.githubusercontent.com/85887330/122803363-8303f700-d294-11eb-9262-049f60ae17ea.png)


# azone_hh_veh_mean_age.csv 

This file provides inputs for mean auto age and mean light truck age and is used in the AssignVehicleAge module.

![image](https://user-images.githubusercontent.com/85887330/122809238-d594e180-d29b-11eb-8e26-5cb0d587dce0.png)


# azone_hh_veh_own_taxes.csv 

This file provides inputs for flat fees/taxes (i.e. annual cost per vehicle) and ad valorem taxes (i.e. percentage of vehicle value paid in taxes). The file is used in CalculateVehicleOwnCost module.

- Contact DOT

![image](https://user-images.githubusercontent.com/85887330/122964279-13097580-d355-11eb-9c5b-d20f94d2117c.png)

[See Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#calculatevehicleoperatingcost)

# azone_hhsize_targets.csv 

This file contains the household specific targets and is used in CreateHouseholds module.

- Contact Person/Office who would have a good understanding of population forecasts by age group
- Age-based population forecasts are also included in UrbanSim outputs

![image](https://user-images.githubusercontent.com/85887330/122816533-de3de580-d2a4-11eb-89bf-79edc22f1776.png)


# azone_lttrk_prop.csv 

This file specifies the light truck proportion of the vehicle fleet and is used in AssignVehicleType module.

- Contact Rob from Energy & CC
- Contact DOT (see https://www.dmv.pa.gov/VEHICLE-SERVICES/Title-Registration/Pages/Fleet.aspx)

![image](https://user-images.githubusercontent.com/85887330/122815694-ca45b400-d2a3-11eb-9260-5898b704e29c.png)

[See Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#assignvehicletype)

# azone_payd_insurance_prop.csv 

This file provides inputs on the proportion of households having PAYD (pay-as-you-drive) insurance and is used in the CalculateVehicleOwnCost module.

![image](https://user-images.githubusercontent.com/85887330/122964420-40562380-d355-11eb-99f1-3d4d42ab2462.png)

[See Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#calculatevehicleowncost)

* Not sure where to locate 

# azone_per_cap_inc.csv

This file contains information on regional average per capita household and group quarters income in year 2010 dollars and is used in the PredictIncome module.

![image](https://user-images.githubusercontent.com/85887330/122844662-2292ab00-d2d0-11eb-9693-09d6429f472f.png)

- Azone income per cap = total income of people in Azone/ # of Residents in A zone

# azone_prop_sov_dvmt_diverted.csv 

This file provides inputs for a goal for diverting a portion of SOV travel within a 20-mile tour distance and is used in the DivertSovTravel module.

- Doesnt need to be changed ?
- Contact whicever person/office would be able to provide a goal for SOV divertion

# azone_relative_employment.csv 

This file contains ratio of workers to persons by age and is used in the PredictWorkers module.
- Use UrbanSum Output

![image](https://user-images.githubusercontent.com/85887330/122814901-cf563380-d2a2-11eb-8c00-1a96b4991292.png)

[See Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#predictworkers)

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
