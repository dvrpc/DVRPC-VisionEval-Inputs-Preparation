--Attempt 1
create table "transform".block_attributes_2019test
as select *
from "transform".gqcounts g2 
full OUTER JOIN "transform".block_attributes_2019 ba 
on ba.block_id = g2.block_id;

--Attempt 2
SELECT *
FROM "transform".block_attributes_2019 ba , "transform".gqcounts g 
WHERE ba.block_id = g.block_id 
union 
SELECT *
FROM "transform".block_attributes_2019 ba , "transform".gqcounts g 
WHERE ba.block_id != g.block_id 

select
  gq_type,
  gq_count
FROM "transform".gqcounts g
FULL join "transform".block_attributes_2019 ba 
  ON g.block_id = ba.block_id;
 
 create table "transform".block_attributes_2019final as (
 select ba.*, gq.gq_type, gq.gq_count from "transform".block_attributes_2019 as ba
full join "transform".gqcounts gq on gq.block_id = ba.block_id
)
  
create table "transform".block_attributes_2050final as (
 select ba.*, gq.gq_type, gq.gq_count from "transform".block_attributes_2050 as ba
full join "transform".gqcounts gq on gq.block_id = ba.block_id
)