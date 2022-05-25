create table "transform".household_income_2019 as (
select baw.*,
uh2.income,
uh2.household_id 
from "transform".block_attributes_2019 baw
full join "extract".usim__2019_households uh2 on uh2.block_id = baw.block_id 
)
--baf."year",baf.block_id, baf.lutype, baf.sf_count, baf.mf_count, baf.bzone_id, baf.azone_id

create table "transform".income_by_azone as (
select 
hi.azone_id,
min(hi.income),
percentile_cont(0.25) within group (order by hi.income) as q1,
percentile_cont(0.5) within group (order by hi.income) as q2,
percentile_cont(0.75) within group (order by hi.income) as q3,
max(hi.income)
from "transform".household_income_2019 hi 
group by azone_id 
)

-- Total # of households in each block grp

create table transform.bzone_hh as (
select baf.bzone_id as Geo,
	   sum(baf.sf_count) as SFDU,
	   sum(baf.mf_count) as MFDU,
	   sum(baf.sf_count) + sum(baf.mf_count) as totalhh
from "transform".block_attributes_2019 baf 
group by baf.bzone_id
)
	

--# of households in each bzone that fall within corresponding azones quantile range
--Step1: Label each bzonea household s firstq, secondq,...
--Step2: Count how many households in each bzone belong to a given quartile range 
--Step3: Find proportion: blockcount for quartile/total households in azone

create table "transform".bzone__income_quartiles as (
select  
    hi2.household_id,
    hi2.income,
    hi2.azone_id,
    hi2.bzone_id,
    case
        when hi2.income between iqba2.min and iqba2.q1 then 'q1'
        when hi2.income between iqba2.q1 + 1 and iqba2.q2 then 'q2'
        when hi2.income between iqba2.q2 + 1 and iqba2.q3 then 'q3'
        when hi2.income between iqba2.q3 + 1 and iqba2.max then 'q4'        
    end as inquantile
from
    "transform".household_income_2019 hi2
full join "transform".income_quartiles_by_azone iqba2 on iqba2.azone_id = hi2.azone_id  
group by 
    hi2.household_id, hi2.income, hi2.azone_id, hi2.bzone_id, inquantile
    )

create table "transform".incquartilecounts_bzone as (
	select
	'2019' as year,
	bzone_id,
	sum(case when biq.inquantile = 'q1' then 1 end) as q1count,
	sum(case when biq.inquantile = 'q2' then 1 end) as q2count,
	sum(case when biq.inquantile = 'q3' then 1 end) as q3count,
	sum(case when biq.inquantile = 'q4' then 1 end) as q4count
	from "transform".bzone__income_quartiles biq 
	group by bzone_id 
)


create table staging.bzone_hh_inc_qrtl_prop_final as (
	select 
	bh.geo,
	'2019' as year
	ib.q1count/bh.totalhh as q1prop,
	ib.q2count/bh.totalhh as q2prop,
	ib.q3count/bh.totalhh as q3prop,
	ib.q4count/bh.totalhh as q4prop
	from "transform".incquartilecounts_bzone ib, "transform".bzone_hh bh 
	where ib.bzone_id = bh.geo
	group by bh.geo, ib.q1count, ib.q2count, ib.q3count, ib.q4count, bh.totalhh
	)


-- 2050
	
create table "transform".household_income_2050 as (
select baw.*,
uh2.income,
uh2."index" 
from "transform".block_attributes_2050_withgq baw
full join "extract".usim_2050_households uh2 on uh2.block_id = baw.block_id 
)
--baf."year",baf.block_id, baf.lutype, baf.sf_count, baf.mf_count, baf.bzone_id, baf.azone_id

create table "transform".income_by_azone2050 as (
select 
hi.azone_id,
min(hi.income),
percentile_cont(0.25) within group (order by hi.income) as q1,
percentile_cont(0.5) within group (order by hi.income) as q2,
percentile_cont(0.75) within group (order by hi.income) as q3,
max(hi.income)
from "transform".household_income_2050 hi 
group by azone_id 
)

-- Total # of households in each block grp

create table transform.bzone_hh_2050 as (
select baf.bzone_id as Geo,
	   sum(baf.sf_count) as SFDU,
	   sum(baf.mf_count) as MFDU,
	   sum(baf.sf_count) + sum(baf.mf_count) as totalhh
from "transform".block_attributes_2050_withgq baf 
group by baf.bzone_id
)
	

--# of households in each bzone that fall within corresponding azones quantile range
--Step1: Label each bzonea household s firstq, secondq,...
--Step2: Count how many households in each bzone belong to a given quartile range 
--Step3: Find proportion: blockcount for quartile/total households in azone


-- Stuck here bc theres not household id to group by

create table "transform".bzone__income_quartiles_2050 as (
select  
 	hi2.index,
    hi2.income,
    hi2.azone_id,
    hi2.bzone_id,
    case
        when hi2.income between iqba2.min and iqba2.q1 then 'q1'
        when hi2.income between iqba2.q1 + 1 and iqba2.q2 then 'q2'
        when hi2.income between iqba2.q2 + 1 and iqba2.q3 then 'q3'
        when hi2.income between iqba2.q3 + 1 and iqba2.max then 'q4'        
    end as inquantile
from
    "transform".household_income_2050 hi2
full join "transform".income_quartiles_by_azone iqba2 on iqba2.azone_id = hi2.azone_id  
group by 
	hi2.index, hi2.income, hi2.azone_id, hi2.bzone_id, inquantile
    )

create table "transform".incquartilecounts_bzone_2050 as (
	select
	'2050' as year,
	bzone_id,
	sum(case when biq.inquantile = 'q1' then 1 end) as q1count,
	sum(case when biq.inquantile = 'q2' then 1 end) as q2count,
	sum(case when biq.inquantile = 'q3' then 1 end) as q3count,
	sum(case when biq.inquantile = 'q4' then 1 end) as q4count
	from "transform".bzone__income_quartiles biq 
	group by bzone_id 
)

create table staging.bzone_hh_inc_qrtl_prop_final as (
	select 
	bh.geo,
	'2019' as year,
	ib.q1count/bh.totalhh as q1prop,
	ib.q2count/bh.totalhh as q2prop,
	ib.q3count/bh.totalhh as q3prop,
	ib.q4count/bh.totalhh as q4prop
	from "transform".incquartilecounts_bzone ib, "transform".bzone_hh bh 
	where ib.bzone_id = bh.geo
	group by bh.geo, ib.q1count, ib.q2count, ib.q3count, ib.q4count, bh.totalhh
union
	select 
	bh.geo,
	'2050' as year,
	ib.q1count/bh.totalhh as q1prop,
	ib.q2count/bh.totalhh as q2prop,
	ib.q3count/bh.totalhh as q3prop,
	ib.q4count/bh.totalhh as q4prop
	from "transform".incquartilecounts_bzone_2050 ib, "transform".bzone_hh_2050 bh 
	where ib.bzone_id = bh.geo
	group by bh.geo, ib.q1count, ib.q2count, ib.q3count, ib.q4count, bh.totalhh
	)




