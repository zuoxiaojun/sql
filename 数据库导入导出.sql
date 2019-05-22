/*
oracle数据库导入
*/
--1、创建导入用户
CREATE USER NC20190521 IDENTIFIED BY 1 DEFAULT TABLESPACE NNC_DATA01 TEMPORARY TABLESPACE temp;
GRANT connect,dba to NC20190521;

--2、创建虚拟目录（可用以下语句查询出已经创建的虚拟目录）
create or replace directory expdp_dir as 'D:\';--物理路径
select * from dba_directories;

--3、授权导入用户读写虚拟目录的权限
grant read,write on directory expdp_dir to NC20190521;

--构造导入语句（要在cmd里执行）
impdp NC20190521/1 directory=expdp_dir dumpfile=AODE20190521.dmp logfile=AODE20190521.log REMAP_SCHEMA=NC65:NC20190521


/*oracle数据库导出*/

--1、创建虚拟目录（可用以下语句查询出已经创建的虚拟目录）
create or replace directory expdp_dir as 'D:\';
select * from dba_directories;

--2、授权导出用户读写虚拟目录的权限
grant read,write on directory expdp_dir to backup_user;

--3、构造导出语句（要在cmd里执行）
expdp backup_user/backup_user directory=expdp_dir dumpfile=data_name.dmp logfile=logname.log









