
--应付单本币数据查询
select  *
  from ap_payableitem
 where pk_payablebill = (select pk_payablebill
                           from ap_payablebill
                          where billno = '80100YF18110013'
                            and dr = 0)
   for update


select *
  from ap_payablebill
 where billno = '80100YF18110214'
   and dr = 0  for update 
