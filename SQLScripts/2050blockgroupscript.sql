create table transform.block_attributes_2050_ as (
	with intersects as (
	    select 
	        b.geoid10,
	        s.uatyp10 as lutype
	    from 
	        extract.blocks_2010 b,
	        extract.stateurbanareas_2012 s
	    where st_intersects(s.geom, st_centroid(b.geom))
	),
	intersectresults as (
	    select
	        b.geoid10 as block_id,
	        case
	            when lutype is null then 'Rural'
	            else lutype
	        end as lutype
	    from extract.blocks_2010 b
	    full join intersects on b.geoid10 = intersects.geoid10
	),
	buildinglookup as (
	    select 
	        block_id,
	        case 
	            when uru2.building_type_id = 1 or uru2.building_type_id = 3 then 'SF'
	            else 'MF'
	        end as building_desc
	    from 
	        extract.usim_570_2050_residential_units uru2
	),
	countbuilding as (
	    select 
	        block_id,
	        count(case
	            when building_desc = 'SF' then block_id
	            else null
	            end) as SF_count,
	        count(case
	            when building_desc = 'MF' then block_id
	            else null
	            end) as MF_count
	    from buildinglookup
	    group by block_id
	),
	finaltable as (
	    select
	    	'2050' as year,
		        i.block_id,
		        case
		        when i.lutype = 'U' then 'Urban'
		        when i.lutype = 'C' then 'Town'
		        else i.lutype
		        end as lutype,
	        c.sf_count,
	        c.mf_count,
	        left(i.block_id,12) as bzone_id
	    from countbuilding c
	    full join intersectresults i on c.block_id = i.block_id
	)
	select
	f.*,
	azone_id
	from finaltable f
	join transform.bzone_to_azone bta on f.bzone_id = bta.bzone_id
	)
	
	--combine gq with rest of block data
create table "transform".block_attributes_2050_withgq_ as (
select 
baf.*, 
gq.gq_type, 
gq.gq_count 
from "transform".block_attributes_2050_ as baf
full join "transform".gqcounts gq on gq.block_id = baf.block_id
)
