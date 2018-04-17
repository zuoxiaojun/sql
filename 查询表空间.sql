select * from v$tablespace;
select name,
       BYTES / 1024 / 1024 / 1024 G,
       round(BYTES / (32 * 1204 * 1024 * 1024) * 100, 2) || '%' 空间占比
  from v$datafile;
       
select FILE_NAME,
       BYTES / 1024 / 1024 / 1024 G,
       round(BYTES / (32 * 1204 * 1024 * 1024) * 100, 2) || '%' 空间占比
  from dba_data_files

