# azone_charging_availability.csv

This file has data on proportion of different household types who has EV charging available and is used in the AssignHHVehiclePowertrain module.

# region_carsvc_powertrain_prop.csv

This file is used to specify the powertrain proportion of car services and is optional. The file is used in the Initialize (VETravelPerformance), AssignHhVehiclePowertrain and AdjustHhVehicleMpgMpkwh modules.

# region_comsvc_lttrk_prop.csv

This file supplies data for the light truck proportion of commercial vehicles and is used in the CalculateComEnergyAndEmissions module.

# azone_electricity_carbon_intensity.csv

This file is used to specify the carbon intensity of electricity and is optional (only needed if user wants to modify the values). The file is used in Initialize (VEPowertrainsAndFuels) and CalculateCarbonIntensity modules.

# marea_transit_ave_fuel_carbon_intensity.csv

This file is used to specify the average carbon intensity of fuel used by transit and is optional. The file is used in the Initialize (VETravelPerformance) module.

# marea_transit_biofuel_mix.csv

This file is used to specify the biofuel used by transit and is optional. The file is used in the Initialize (VETravelPerformance) and CalculateCarbonIntensity modules.

# marea_transit_fuel.csv

This file is used to specify the transit fuel proportions and is optional. The file is used in the Initialize (VETravelPerformance) and CalculateCarbonIntensity modules.

# marea_transit_powertrain_prop.csv

This file is used to specify the mixes of transit vehicle powertrains and is optional. The file is used in the Initialize (VETravelPerformance) and CalculatePtranEnergyAndEmissions modules.

# region_ave_fuel_carbon_intensity.csv

This file is used to specify the average carbon density for different vehicle types and is optional (only needed if user wants to modify the values). The file is used in the Initialize (VETravelPerformance) and CalculateCarbonIntensity modules.

# region_comsvc_powertrain_prop.csv

This file is used to specify the powertrain proportion of commercial vehicles and is optional. The file is used in the Initialize (VEPowertrainsAndFuels) and CalculateComEnergyAndEmissions modules.

# region_hvytrk_powertrain_prop.csv

This file is used to specify the powertrain proportion of heavy duty trucks and is optional. The file is used in the Initialize (VEPowertrainsAndFuels) and CalculateComEnergyAndEmissions modules.

Also see:

[Carbon Intensity Module] (https://github.com/visioneval/VisionEval/blob/master/sources/modules/VELandUse/inst/module_docs/AssignDemandManagement.md#bzone_travel_demand_mgtcsv)