--差旅费报销单结算报错银行账户期初余额不存在
select pk_account, init_primal
  from cmp_initdata
 where pk_account = '1001D110000000CA6W97'  --查询期初余额
 
 select pk_account
  from cmp_detail
 where pk_settlement =
       (select pk_settlement
          from cmp_settlement
         where billcode = '80504CL18100002')  for update  --结算单银行账户
         
 
 select dr from bd_bankaccsub where  pk_bankaccsub   = '1001D110000000DHY97C'  for update 
 
 select pk_bankaccbas  from bd_bankaccsub where pk_bankaccsub ='1001D110000000C5PVE5'
 
 select * from bd_bankaccbas where pk_bankaccbas ='1001D110000000C5PVE4'
