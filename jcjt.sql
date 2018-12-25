select  * from dba_users;
select * from dba_directories
grant read,write on directory DUMP to MA1


expdp MA1/MA1 directory=dump dumpfile=ma1.dmp logfile=ma1.log

drop user MAZS cascade;


select username,sid,serial# ,status from v$session where username='MAZS'

select * from v$session where username='MAZS'

alter system kill session '200,190';

alter user ma1 account unlock

select * from v$datafile
select * from v$tablespace

select * from dba_directories

create or replace directory expdp_dir as 'F:\dump';

CREATE USER MAZS IDENTIFIED BY MAZS DEFAULT TABLESPACE NNC_DATA01 TEMPORARY TABLESPACE temp;

GRANT connect,dba to MAZS;
GRANT connect,dba to ma1;


CREATE USER ma1 IDENTIFIED BY ma1 DEFAULT TABLESPACE NNC_DATA01 TEMPORARY TABLESPACE temp;

grant read,write on directory EXPDP_DIR to jcjt;

grant read,write on directory EXPDP_DIR to MAZS;


impdp mazs/mazs directory=expdp_dir dumpfile=MA1220.dmp logfile=MA1220.log REMAP_SCHEMA=mazs:mazs







