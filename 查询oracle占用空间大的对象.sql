
--��ѯoracleռ�ÿռ��Ķ���

select SEGMENT_NAME, round((bytes / 1024 / 1024 / 1024), 4) G
  from user_segments
 order by bytes desc;

select * from dba_lobs where owner = 'GCLSINC'
