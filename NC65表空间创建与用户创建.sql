
--NC65表空间创建
create tablespace nnc_data01 datafile
'/u01/nnc_data01.dbf' size 500M autoextend on next 50M extent management local uniform size 256k;

create tablespace nnc_index01 datafile
'/u01/nnc_index01.dbf' size 500M autoextend on next 50M extent management local uniform size 128k;

alter system set deferred_segment_creation=false;

commit;

--用户创建
CREATE USER NC65 IDENTIFIED BY NC65 DEFAULT TABLESPACE NNC_DATA01 TEMPORARY TABLESPACE temp;
GRANT connect,dba to NC65;
commit;

