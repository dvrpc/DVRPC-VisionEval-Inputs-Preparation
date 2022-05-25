create table "transform".lookuptable as (
	select baf.block_id as block_id,
		   left(baf.block_id,12) as bzone_id,
		   baf.azone_id as azone_id,
		   g.czone as Czone,
		   g.marea as Marea
	from "transform".block_attributes_2019final baf,
		 "staging".geo g 
	where g.bzone = baf.bzone_id
)