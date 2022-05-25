--create table azone_gq_pop_by_age (geo smallint, Yr VARCHAR, GrpAge0to14 smallint, GrpAge15to19 smallint, GrpAge20to29 smallint, GrpAge30to54
--smallint, GrpAge55to64 smallint, GrpAge65Plus smallint);
COPY azone_gq_pop_by_age FROM 'C:\Users\fakram\Downloads\azone_gq_pop_by_age' DELIMITER ',' CSV HEADER;
