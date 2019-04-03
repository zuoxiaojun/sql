--划账结算单报期初余额不存在
--资金系统对照银行账户传值错误

select pk_account, formcode, init_primal,realtime_primal , dr
  from cmp_initdata
 where pk_account = '1001D1100000005G7RN3'
   and dr = 0 --查询期初余额


--划账结算单

select pk_transformbill,
       transformoutaccount, --划出账户
       transforminaccount --划入账户
  from cmp_transformbill
 where vbillno = '36S4190300026'
   and dr = 0
   and pk_org =
       (select pk_financeorg from org_financeorg where code = '809') for update
