/*
oracle���ݿ⵼��
*/
--1�����������û�
CREATE USER NC20190521 IDENTIFIED BY 1 DEFAULT TABLESPACE NNC_DATA01 TEMPORARY TABLESPACE temp;
GRANT connect,dba to NC20190521;

--2����������Ŀ¼��������������ѯ���Ѿ�����������Ŀ¼��
create or replace directory expdp_dir as 'D:\';--����·��
select * from dba_directories;

--3����Ȩ�����û���д����Ŀ¼��Ȩ��
grant read,write on directory expdp_dir to NC20190521;

--���쵼����䣨Ҫ��cmd��ִ�У�
impdp NC20190521/1 directory=expdp_dir dumpfile=20190521.dmp logfile=AODE20190521.log REMAP_SCHEMA=NC65:NC20190521


/*oracle���ݿ⵼��*/

--1����������Ŀ¼��������������ѯ���Ѿ�����������Ŀ¼��
create or replace directory expdp_dir as 'D:\';
select * from dba_directories;

--2����Ȩ�����û���д����Ŀ¼��Ȩ��
grant read,write on directory expdp_dir to backup_user;

--3�����쵼����䣨Ҫ��cmd��ִ�У�
expdp backup_user/backup_user directory=expdp_dir dumpfile=data_name.dmp schemas=backup_user logfile=logname.log









