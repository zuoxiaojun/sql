select * from v$tablespace;
select name,
       BYTES / 1024 / 1024 / 1024 G,
       round(BYTES / (32 * 1204 * 1024 * 1024) * 100, 2) || '%' �ռ�ռ��
  from v$datafile;
       
select FILE_NAME,
       BYTES / 1024 / 1024 / 1024 G,
       round(BYTES / (32 * 1204 * 1024 * 1024) * 100, 2) || '%' �ռ�ռ��
  from dba_data_files

