create table landusetypes2 as (
	select 
    	b.blockce10 as blockid,
   		uru.building_type_id as building_type,
    	bta.bzone_id as bzone_id,
    	case
       		when st_intersects(s.geom,st_centroid(b.geom)) = true then s.uatyp10
       		else 'R'
    	end as landuse,
    	case 
    		when uru.building_type_id = 1 then 'SF'
    		when uru.building_type_id = 2 then 'MF'
    		when uru.building_type_id = 3 then 'SF'
    		when uru.building_type_id = 4 then 'MF'
    		else ' '
    	end as building_desc
	from 
    	"extract".blocks_2010 b,
    	"transform".bzone_to_azone bta, 
    	"extract".stateurbanareas_2012 s,
    	"extract".usim__2050_residential_units uru
    )
    