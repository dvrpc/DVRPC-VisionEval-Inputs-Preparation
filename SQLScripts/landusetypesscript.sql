create table landusetypes as (
	select 
    	b.blockce10 as blockid,  
    	case
        	when st_intersects(s.geom,st_centroid(b.geom)) = true then s.uatyp10
        	else 'R'
    	end as landuse      
	from 
    	"extract".blocks_2010 b,
    	"extract".stateurbanareas_2012 s
    )