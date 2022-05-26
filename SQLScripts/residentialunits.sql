
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
            when lutype is null then 'R'
            else lutype
        end as lutype
    from extract.blocks_2010 b
    full join intersects on b.geoid10 = intersects.geoid10
),
buildinglookup as (
    select 
        block_id,
        case 
            when uru.building_type_id = 1 or uru.building_type_id = 3 then 'SF'
            else 'MF'
        end as building_desc
    from 
        extract.usim__2019_residential_units uru
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
countgq as (
	select 
		ugq.block_id,
		count(case 
			when gq_type  then block_id -- set condition for the first letter of gq_type being 'N'
			else null
		end) as GQ_count
	from "extract".usim__2019_group_quarters ugq 
	group by block_id --for urban_du_proportions
),	
finaltable as (
    select
    	'2019' as year,
        i.block_id,
        i.lutype,
        c.sf_count,
        c.mf_count,
        left(i.block_id,11) as bzone_id,
        GQ_count as gq_count --added by fiza
        
    from countbuilding c
    full join intersectresults i on c.block_id = i.block_id
)
select
f.*,
azone_id
from finaltable f
join transform.bzone_to_azone bta on f.bzone_id = bta.bzone_id
