create table transform.bzone_network_design as (
select 
	geoid10 as Geo,
	d3bpo4 as D3bpo4,
	'2019' as Year
from 
	extract.sld_34 s 
	   
union

select 
	geoid10 as Geo,
	d3bpo3 as D3bpo4,
	'2019' as Year
from 
	extract.sld_42 s 
)

insert into "transform".bzone_network_design
	select 
	geoid10 as Geo,
	d3bpo4 as D3bpo4,
	'2050' as Year
from 
	extract.sld_34 s 
	   
union

select 
	geoid10 as Geo,
	d3bpo3 as D3bpo4,
	'2050' as Year
from 
	extract.sld_42 s 
	
create table staging.bzone_network_design_dvrpc as (
	select bnd.geo, bnd.d3bpo4, bnd."year" 
	FROM staging.bzone_hh_inc_qrtl_prop bhiqp
	INNER JOIN staging.bzone_network_design bnd 
	ON bnd.geo = bhiqp.geo
	)