select * from v$tablespace; --��ѯϵͳ��ռ�

select * from dba_data_files; --��ѯ�����ļ�����ռ���Ϣ

create tablespace mytbs3
datafile '/data/oracle/oradata/orcl/mytbs3.dbf'size 5M
autoextend on next 1M maxsize 50M;   --������ռ䣬����Ϊ�Զ����������50M

select file_name ,autoextensible from dba_data_files ;

alter database 
datafile '/data/oracle/oradata/orcl/mytbs3.dbf' resize 10M;

alter tablespace mytbs3 read only;
alter tablespace mytbs3 read write;

create table test(
 name varchar2(200)  unique
 )
 tablespace mytbs3;
 
 
 select * from test;
 
 insert into test values('1111');
 
 





