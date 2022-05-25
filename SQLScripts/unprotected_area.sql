
create table "transform".unprotected_areas as (
	select
	ltba.block,
	sum(ltba.acres) as unprotected_areas
	from extract.lu_type_block_acres ltba
	where ltba.impacts2050_lutype <> '400'
	group by ltba.block,ltba.acres 
)

create table "transform".block_attributes_2019final2 as (
select baf.*,
ua.unprotected_areas
from "transform".block_attributes_2019final as baf 
full join "transform".unprotected_areas ua on ua.block = baf.block_id
)