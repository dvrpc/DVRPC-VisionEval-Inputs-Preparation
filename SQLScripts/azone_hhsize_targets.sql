
create temp table getcounts as (
	select 
	l.azone_id,
	avg(persons) as avehhsize,
	sum(persons) as totalhh,
	sum(case when persons = '1' then 1 end) as oneper
-- oneper/totalhh as Prop1PerHh
	from "transform".lookuptable l, extract.usim__2019_households uh 
	where uh.block_id = l.block_id 
	group by l.azone_id
)

create table staging.azone_hhsize_targets_2019 as (
	select
	azone_id as Geo,
	'2019' as year,
	avehhsize,
	oneper/totalhh as Prop1Perhh
	from pg_temp.getcounts
	group by geo, avehhsize, oneper, totalhh
)


create temp table getcounts2 as (
	select 
	l.azone_id,
	avg(persons) as avehhsize,
	sum(persons) as totalhh,
	sum(case when persons = '1' then 1 end) as oneper
-- oneper/totalhh as Prop1PerHh
	from "transform".lookuptable l, extract.usim_2050_households uh2
	where uh2.block_id = l.block_id 
	group by l.azone_id
)

create table staging.azone_hhsize_targets_2050 as (
	select
	azone_id as Geo,
	'2050' as year,
	avehhsize,
	oneper/totalhh as Prop1Perhh
	from pg_temp.getcounts2
	group by geo, avehhsize, oneper, totalhh
)