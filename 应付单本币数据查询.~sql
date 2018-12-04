
--应付单本币数据查询
select grouprate,
       globalrate,
       rate,
       groupcrebit     "集团本币金额(贷方)" ,
       globalcrebit "全局本币金额(贷方)",
       groupnotax_cre  "集团本币无税金额(贷方)",
       globalnotax_cre "全局本币无税金额(贷方)",
       local_money_cr  "组织本币金额",  
       local_notax_cr  "组织本币无税金额",
       pk_currtype     "币种",
       money_cr "贷方原币金额"   
  from ap_payableitem
 where pk_payablebill = (select pk_payablebill
                           from ap_payablebill
                          where billno = '82500YF18050020'
                            and dr = 0)
   for update


select local_money,grouplocal,globallocal,pk_currtype 
  from ap_payablebill
 where billno = '81800YF18050017'
   and dr = 0  for update 
