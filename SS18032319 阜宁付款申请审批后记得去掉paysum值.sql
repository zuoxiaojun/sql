
--SS18032319 阜宁付款申请审批后记得去掉paysum值
select applysum, paysum
  from cmp_apply
 where vbillno = 'SS18032319'
   for update
