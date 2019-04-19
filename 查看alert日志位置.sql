
--查看alert日志位置
select * from v$diag_info where name ='Diag Alert';
select * from v$diag_info where name = 'Diag Trace';
select * from v$diag_info;

alter table GL_DETAIL modify excrate2 NUMBER(15,8);
