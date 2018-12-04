
--应付单本币数据查询
select grouprate,
       globalrate,
       rate,
       groupcrebit    ,-- "集团本币金额(贷方)" ,
       globalcrebit ,--"全局本币金额(贷方)",
       groupnotax_cre,--  "集团本币无税金额(贷方)",
       globalnotax_cre,-- "全局本币无税金额(贷方)",
       local_money_cr,--  "组织本币金额",  
       local_notax_cr ,-- "组织本币无税金额",
       pk_currtype ,--    "币种",
       money_cr --"贷方原币金额"   
  from ap_payableitem
 where pk_payablebill = (select pk_payablebill
                           from ap_payablebill
                          where billno = '80100YF18110213'
                            and dr = 0)
   for update


select *
  from ap_payablebill
 where billno = '80100YF18110214'
   and dr = 0  for update 
