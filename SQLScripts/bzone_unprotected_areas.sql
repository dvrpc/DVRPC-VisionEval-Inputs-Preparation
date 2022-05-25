create table staging.bzone_unprotected_areas as (
select
	baf.bzone_id, 
	baf."year",
--	baf.unprotected_areas,
	SUM(case when baf.lutype = 'Urban' then baf.unprotected_areas else 0 end) as urbanarea,
	SUM(case when baf.lutype = 'Town' then baf.unprotected_areas else 0 end) as townarea,
	SUM(case when baf.lutype = 'Rural' then baf.unprotected_areas else 0 end) as ruralarea
FROM "transform".block_attributes_2019final2 baf 
group by baf.bzone_id, baf."year"
)
 	

