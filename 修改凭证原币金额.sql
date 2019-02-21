
--修改凭证金额
select detailindex,
       debitamount, --原币借方金额
       creditamount, --原币贷方金额
       -- globaldebitamount, --全局本币借方金额 
       --  globalcreditamount, --全局本币贷方金额 
       groupdebitamount, --集团本币借方金额
       groupcreditamount, --集团本币贷方金额
       localcreditamount, --组织本币贷方金额
       localdebitamount --组织本币借方金额
  from gl_detail
 where nov = '25' --凭证号
  -- and detailindex = '1' --行号
   and explanation = '冲2018年9月预提美西美东仓储费'
   for update

select totaldebit,--借方合计 
       totaldebitglobal,--全局借方合计 
       totaldebitgroup,--集团借方合计
       totalcredit,--贷方合计
       totalcreditglobal,--全局贷方合计
       totalcreditgroup --集团贷方合计
  from gl_voucher
 where explanation = '冲2018年9月预提美西美东仓储费'
 for update 
