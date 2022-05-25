
create table staging.bzone_employment_ as (
	SELECT 
		l.bzone_id as Geo,
		'2019' as year,
		count(l.bzone_id) as totalemp,
		sum(case when uj.sector_id = '4445' then 1 end) as retailemp, 
	    sum(case when uj.sector_id BETWEEN '51' AND '99' then 1 end) as servicemp 
	FROM 
		"extract".usim__2019_jobs uj, "transform".lookuptable l 
	where l.block_id = uj.block_id 
	group by l.bzone_id 
	
	union
	
		SELECT 
		l.bzone_id as Geo,
		'2050' as year,
		count(l.bzone_id) as totalemp,
		sum(case when uj2.sector_id = '4445' then 1 end) as retailemp, 
	    sum(case when uj2.sector_id BETWEEN '51' AND '99' then 1 end) as servicemp 
	FROM 
		"extract".usim__570_2050_jobs uj2, "transform".lookuptable l 
	where l.block_id = uj2.block_id 
	group by l.bzone_id 
)

UPDATE staging.bzone_employment 
SET servicemp = 0
WHERE servicemp IS Null