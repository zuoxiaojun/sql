
--查询oracle占用空间大的对象

select SEGMENT_NAME, round((bytes / 1024 / 1024 / 1024), 4) G
  from user_segments
 order by bytes desc;

select * from dba_lobs where owner = 'GCLSINC'
