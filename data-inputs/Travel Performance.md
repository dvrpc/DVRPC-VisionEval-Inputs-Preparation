# CalculateMpgMpkwhAdjustments Module

[Module + Input Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#calculatempgmpkwhadjustments)

## marea_speed_smooth_ecodrive.csv

This input file supplies information of deployment of speed smoothing and ecodriving by road class and vehicle type and is used in the CalculateMpgMpkwhAdjustments module.

# CalculateVehicleOperatingCost module

[Module Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#calculatevehicleoperatingcost)

## azone_fuel_power_cost.csv

This file supplies data for retail cost of fuel and electricity and is used in the CalculateVehicleOperatingCost module.

## azone_veh_use_taxes.csv

This file supplies data for vehicle related taxes and is used in the CalculateVehicleOperatingCost module.

## azone_vehicle_access_times.csv

This file supplies data for vehicle access and egress time and is used in the CalculateVehicleOperatingCost module.

[Input Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#user-input-files-34)

## region_prop_externalities_paid.csv

This file supplies data for climate change and other social costs and is used in the CalculateVehicleOperatingCost module.

# CalculateFutureRoadDvmt Modules

[Module Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#calculatefutureroaddvmt)

## region_base_year_hvytrk_dvmt.csv

This file is used to specify the heavy truck dvmt for base year and is optional. The file is used in the Initialize (VETravelPerformance), CalculateBaseRoadDvmt and CalculateFutureRoadDvmt modules.

[Input Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#user-input-files-30)

## marea_base_year_dvmt.csv

This file is used to specify to adjust the dvmt growth factors and is optional (only needed if user wants to modify the values). The file is used in the Initialize (VETravelPerformance), CalculateBaseRoadDvmt and CalculateFutureRoadDvmt modules.

## marea_dvmt_split_by_road_class.csv

This file is used to specify the dvmt split for different road classes and is optional. The file is used in the Initialize (VETravelPerformance) and CalculateBaseRoadDvmt modules.

# CalculateRoadPerformance Modules

[Module Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#calculateroadperformance)

## marea_congestion_charges.csv

This file is used to specify the charges of vehicle travel for different congestion levels and is optional. The file is used in the Initialize (VETravelPerformance) and CalculateRoadPerformance modules.

## marea_operations_deployment.csv

This file is used to specify the proportion of dvmt affected by operations for different road classes and is optional. The file is used in the Initialize (VETravelPerformance) and CalculateRoadPerformance modules.

[Input Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#user-input-files-31)

## other_ops_effectiveness.csv

This file is used to specify the delay effects of operations in different road classes and is optional (only needed if user wants to modify the values). The file is used in the Initialize (VETravelPerformance) and CalculateRoadPerformance modules.

