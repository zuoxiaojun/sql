--累计付款金额不可大于累计付款申请的金额（外币汇率导致）
--付款申请汇率大于合同汇率
select busistatus, vbillstatus
  from cmp_apply
 where vbillno = 'SS17120120'
   --for update --汇率问题导致付款单保存报错  累计付款金额不可大于累计付款申请的金额
