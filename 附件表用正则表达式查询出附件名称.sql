--��������������ʽ��ѯ����������
select pk_doc,
       regexp_substr(filepath, '[^/]*$') filename,
       round(filelength)
  from SM_PUB_FILESYSTEM
 where isfolder = 'n'
