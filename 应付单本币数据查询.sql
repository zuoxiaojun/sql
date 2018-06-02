
--应付单本币数据查询
select grouprate,postquantity
       globalrate,
       rate,
       groupcrebit,
       globalcrebit,
       groupnotax_cre,
       globalnotax_cre,
       local_money_cr,
       notax_cr,
       local_notax_cr
  from ap_payableitem
 where pk_payablebill = (select pk_payablebill
                           from ap_payablebill
                          where billno = '82500YF18050020'
                            and dr = 0)
   for update


select local_money,grouplocal,globallocal
  from ap_payablebill
 where billno = '82500YF18050020'
   and dr = 0  for update 
