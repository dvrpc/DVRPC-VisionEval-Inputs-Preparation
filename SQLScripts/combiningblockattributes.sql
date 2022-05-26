
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