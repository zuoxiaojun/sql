select distinct (contractno)
  from ar_gatheritem
 where dr = 0


--1.查询最近更新数据之前的数据
  select contractno
    from ar_gatheritem as of timestamp to_timestamp('2020-05-15 10:11:00', 'yyyy-mm-dd hh24:mi:ss');

--2.闪回操作前启用行移动功能（不启用不可以闪回）
alter table ar_gatheritem enable row movement;

--3.执行闪回语句：
flashback table ar_gatheritem to timestamp TO_TIMESTAMP('2020-05-15 10:11:00','yyyy-mm-dd hh24:mi:ss');


select * from ar_gatheritem where ts >'2020-05-15 10:10:00'
