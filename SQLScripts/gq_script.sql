create table transform.GQ_counts as (
	SELECT
	    ugq.block_id, gq_type, SUM(gq_pop) as GQ_count
	FROM
	    "extract".usim__2019_group_quarters ugq
	where gq_type like 'N%'
	group by block_id, gq_type 
   )
 
--combine gq with rest of block data
create table "transform".block_attributes_2019_withgq as (
select 
baf.*, 
gq.gq_type, 
gq.gq_count 
from "transform".block_attributes_2019 as baf
full join "transform".gqcounts gq on gq.block_id = baf.block_id
)