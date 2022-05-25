create table "transform".usim_2019_age_by_block as (
select 
uh.serialno,
uh.persons,
uh.block_id,
up.household_id,
up."index",
up.age
FROM
	"extract".usim__2019_households uh
full JOIN "extract".usim__2019_persons up ON uh.household_id= up.household_id
)


create table staging.azone_hh_pop_by_age as (
select 
l.azone_id as Geo,
'2019' as year,
--uabb.block_id,
sum(case when uabb.age between '0' and '14'then 1 end) as age0to14, 
sum(case when uabb.age BETWEEN '15' AND '19' then 1 end) as age15to19,
sum(case when uabb.age BETWEEN '20' AND '29' then 1 end) as age20to29,
sum(case when uabb.age BETWEEN '30' AND '54' then 1 end) as age30to54,
sum(case when uabb.age BETWEEN '55' AND '64' then 1 end) as age55to64,
sum(case when uabb.age > '64' then 1 end) as age64plus
from "transform".lookuptable l, "transform".usim_2019_age_by_block uabb 
where l.block_id = uabb.block_id 
group by l.azone_id
)