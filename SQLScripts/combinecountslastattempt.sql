SELECT transform.block_attributes_2019."year" , transform.block_attributes_2019.lutype , transform.block_attributes_2019.sf_count, 
transform.block_attributes_2019.mf_count, transform.block_attributes_2019.bzone_id, transform.block_attributes_2050.block_id,
transform.gqcounts.gq_type, transform.gqcounts.gq_count, transform.gqcounts.block_id 

FROM "transform".block_attributes_2019 ba 
INNER JOIN gqcounts g ON transform.block_attributes_2019.block_id = transform.gqcounts.block_id

UNION ALL

SELECT transform.gqcounts.year, transform.block_attributes_2019.block_id,
       cast(NULL as  varchar(20)), cast(NULL as integer)
FROM "transform".block_attributes_2019 ba 
WHERE NOT EXISTS (
    SELECT * FROM transform.gqcounts g 
             WHERE g.block_id  = ba.block_id)

UNION ALL

SELECT cast(NULL as varchar(20)), cast(NULL as integer),
       transform.block_attributes_2019, transform.gqcounts 
FROM gqcounts g 
WHERE NOT EXISTS (
    SELECT * from "transform".block_attributes_2019 ba 
             WHERE ba.block_id  = g.block_id)