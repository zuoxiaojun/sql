

--单据类型
select billtypename, pk_billtypecode
  from bd_billtype
 where pk_billtypecode in ('F1', 'F3', 'F0')
