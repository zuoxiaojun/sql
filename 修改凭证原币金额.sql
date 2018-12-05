
     --修改凭证原币金额
select creditamount, debitamount
  from gl_detail
 where nov = '5'  --凭证号
   and detailindex = '1'  --行号
   and explanation = '发票入账CNOT/LQI2018,应付Sertus Incorporations Limited,, 合同号：新加坡公司地址维护'
   for update
