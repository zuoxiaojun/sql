
--修改凭证借贷金额
select debitamount, --原币借方金额
       creditamount, --原币贷方金额   
       groupdebitamount, --集团本币借方金额
       groupcreditamount, -- 集团本币贷方金额  
       localdebitamount, --组织本币借方金额  
       localcreditamount --组织本币贷方金额 
  from gl_detail
 where explanation = '调整1-9#'
   and detailindex = 2
   --and groupdebitamount = 3240.12
   for update
