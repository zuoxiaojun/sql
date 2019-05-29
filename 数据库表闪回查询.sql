--数据库表闪回查询

delete from  htxz

select * from htxz
--闪回查询
select *
  from htxz as of timestamp to_timestamp('2019-05-24 14:50:00', 'yyyy-mm-dd hh24:mi:ss');
  
--闪回操作前启用行移动功能（不启用不可以闪回）

alter table htxz enable row movement;

--执行闪回语句
flashback table htxz to timestamp TO_TIMESTAMP('2019-05-24 14:50:00', 'yyyy-mm-dd hh24:mi:ss');
