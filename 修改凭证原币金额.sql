select creditamount,debitamount
  from gl_detail
 where nov = '41'
   and explanation =
       '结转826日本平台本年利润1' for update  --修改凭证原币金额
