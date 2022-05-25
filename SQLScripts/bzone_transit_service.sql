create table "staging".bzone_transit_service as (

select 
	geo as Geo,
	'2019' as year,
	D4c as D4c
from
	"transform".dvrpc_sld_2019 ds 
		
union 
	
select
	geo as Geo,
	'2050' as year,
	D4c as D4c
from
	"transform".dvrpc_sld_2019 ds 
order by
	year

 );
   
  	
UPDATE staging.bzone_transit_service 
SET d4c = 0
WHERE d4c = "-99,999"

UPDATE 
   staging.bzone_transit_service2
SET 
   d4c = REPLACE (
      d4c,
    '-99,999',
    '0'