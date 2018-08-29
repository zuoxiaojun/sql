select busistatus，vbillstatus，modifier, modifiedtime   from cmp_apply where vbillno = 'SS18090290'  for update  --    3 1
  /* 付款申请单修改为未提交，自由态*/

update cmp_apply
   set busistatus = '1',vbillstatus = '-1'
 where vbillno = 'SS18080289'    --表头


select busistatus, vbillstatus
  from cmp_apply_b
 where pk_apply =
       (select pk_apply from cmp_apply where vbillno = 'SS18090290')   --表体


select * from cmp_apply where vbillno = 'SS18081228'
