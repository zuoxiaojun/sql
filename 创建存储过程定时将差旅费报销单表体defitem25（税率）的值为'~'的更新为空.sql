select distinct(defitem21) from er_busitem

select * from er_busitem where defitem25='6%'

update er_busitem set defitem21 = '' where defitem21 = '~';
update er_busitem set defitem25 = '' where defitem25 = '~'


--创建存储过程定时将差旅费报销单表体defitem25（税率）的值为'~'的更新为空
--创建存储过程定时将差旅费报销单表体defitem21（税率）的值为'~'的更新为空

create or replace procedure update_er_busitem_defitem2125 is
begin
  update er_busitem set defitem21 = '' where defitem21 = '~';
  update er_busitem set defitem25 = '' where defitem25 = '~';
  commit;
end;


select * from user_jobs
