


alter tablespace nnc_data01 add datafile '/data/DataAll/nc/nnc_data01_b1.dbf' size 200m autoextend on next 100m;

select b.file_id �ļ�ID��,
       b.file_name,
       b.tablespace_name ��ռ���,
       b.bytes / 1024 / 1024 || 'M' �ֽ���,
       (b.bytes - sum(nvl(a.bytes, 0))) / 1024 / 1024 || 'M' ��ʹ��,
       sum(nvl(a.bytes, 0)) / 1024 / 1024 || 'M' ʣ��ռ�,
       100 - sum(nvl(a.bytes, 0)) / (b.bytes) * 100 ռ�ðٷֱ�
  from dba_free_space a, dba_data_files b
 where a.file_id = b.file_id
 group by b.tablespace_name, b.file_id, b.bytes, b.file_name
 order by b.file_id;
