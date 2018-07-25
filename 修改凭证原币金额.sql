
     --修改凭证原币金额
select creditamount, debitamount
  from gl_detail
 where nov = '200'
   and detailindex = '22'
   and explanation = '支付3月职工工资'
   for update
