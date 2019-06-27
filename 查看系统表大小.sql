
--查看系统表大小

select bytes / 1024 / 1024 / 1024
  from user_segments
 where SEGMENT_NAME = 'SM_FILESTOREVIEW';

select *
  from (select (bytes / 1024 / 1024 / 1024) G, SEGMENT_NAME
          from user_segments)
 order by G desc

