
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


# azone_hhsize_targets.csv 

This file contains the household specific targets and is used in CreateHouseholds module.

- Contact Person/Office who would have a good understanding of population forecasts by age group
- Age-based population forecasts are also included in UrbanSim outputs

![image](https://user-images.githubusercontent.com/85887330/122816533-de3de580-d2a4-11eb-89bf-79edc22f1776.png)


# azone_per_cap_inc.csv

This file contains information on regional average per capita household and group quarters income in year 2010 dollars and is used in the PredictIncome module.

![image](https://user-images.githubusercontent.com/85887330/122844662-2292ab00-d2d0-11eb-9693-09d6429f472f.png)

- Azone income per cap = total income of people in Azone/ # of Residents in A zone


# azone_relative_employment.csv 

This file contains ratio of workers to persons by age and is used in the PredictWorkers module.
- Use UrbanSum Output

![image](https://user-images.githubusercontent.com/85887330/122814901-cf563380-d2a2-11eb-8c00-1a96b4991292.png)

[See Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#predictworkers)

# bzone_dwelling_units.csv

This file contains the number single-family, multi-family and group-quarter dwelling units and is used in the PredictHousing module.

- Can be found using Census Microdata 

![image](https://user-images.githubusercontent.com/85887330/122844004-b6637780-d2ce-11eb-91aa-9aa78a15695c.png)

[See Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#predicthousing)

# bzone_employment.csv 

This file contains the total, retail and service employment by zone and is used in the LocateEmployment module.

![image](https://user-images.githubusercontent.com/85887330/122843962-9e8bf380-d2ce-11eb-9e6c-623445c6971b.png)

- https://data.census.gov/cedsci/table?q=employment%20philadelphia&tid=ACSDP1Y2019.DP03&hidePreview=true 

[See Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#locateemployment


# bzone_hh_inc_qrtl_prop.csv 

This file contains the proportion of households in 1st, 2nd, 3rd, and 4th quartile of household income and is used in the PredictHousing module.

![image](https://user-images.githubusercontent.com/85887330/122843708-1d346100-d2ce-11eb-939b-051ba1a01c86.png)

[See Documentation](https://github.com/VisionEval/VisionEval-Docs/blob/master/tutorials/verspm/Modules_and_Outputs.md/#predicthousing)

- Average Incomes Table: https://data.census.gov/mdat/#/search?ds=ACSPUMS5Y2019&vv=*FINCP&wt=WGTP 
