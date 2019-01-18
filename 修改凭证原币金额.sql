
--修改凭证金额
select debitamount, --原币借方金额
       creditamount, --原币贷方金额
       -- globaldebitamount, --全局本币借方金额 
       --  globalcreditamount, --全局本币贷方金额 
       groupdebitamount, --集团本币借方金额
       groupcreditamount, --集团本币贷方金额
       localcreditamount, --组织本币贷方金额
       localdebitamount --组织本币借方金额
  from gl_detail
 where nov = '127' --凭证号
   and detailindex = '75' --行号
   and explanation = '支付5月职工工资'
  -- for update
