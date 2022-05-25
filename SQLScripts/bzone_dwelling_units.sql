-- Getting # of SF,MF,GQ in each zone
create table staging.bzone_dwelling_units_ as (
	select baw.bzone_id as Geo,
		baw."year" as Year,
		sum(baw.sf_count) as SFDU,
		sum(baw.mf_count) as MFDU,
		sum(baw.gq_count) as GQDU
	from "transform".block_attributes_2019_withgq baw 
	group by baw.bzone_id, baw."year" 

union 

	select bzone_id as Geo,
		year as year,
		sum(sf_count) as SFDU,
		sum(mf_count) as MFDU,
		sum(gq_count) as GQDU
from "transform".block_attributes_2050_withgq baf 
group by bzone_id, baf."year" 
)


UPDATE staging.bzone_dwelling_units 
SET gqdu = 0
WHERE gqdu is null;