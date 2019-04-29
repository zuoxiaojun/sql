--附件表用正则表达式查询出附件名称
select pk_doc,
       regexp_substr(filepath, '[^/]*$') filename,
       round(filelength)
  from SM_PUB_FILESYSTEM
 where isfolder = 'n'
