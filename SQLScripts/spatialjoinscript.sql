
create table transform.bzone_network_design as (
	select
		bta.azone_id as azone_id,
		bzone_id as bzone_id,
		d3bpo4 as pedcon
	from
		"transform".bzone_to_azone bta, 
		"extract".sld_34005
	join 
		transform.bzone_to_azone bta2 as geo
		
	on st_contains(bta.geom, st_centroid(extract.sld_34005.geom)
	)
	

	
