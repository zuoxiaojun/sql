

select count(*) from user_objects where object_name like '%TEMQ%' and OBJECT_TYPE='TABLE'


select count(*) from user_objects where OBJECT_TYPE='TABLE'--总表

select * from user_objects where object_name like '%TEMQ%' and OBJECT_TYPE='TABLE' order by TIMESTAMP desc

select segment_name, bytes
  from user_segments
 where segment_type = 'TABLE'
   and segment_name like '%TEMQ%'  --表大小


