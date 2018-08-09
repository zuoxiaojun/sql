select busistatus，vbillstatus from cmp_apply where vbillno = 'SS18062655'
  /* 付款申请单修改为未提交，自由态*/

update cmp_apply
   set vbillstatus = '-1', busistatus = '1'
 where vbillno = 'SS18062655'    --表头


select busistatus, vbillstatus
  from cmp_apply_b
 where pk_apply =
       (select pk_apply from cmp_apply where vbillno = 'SS18062655')   --表体
