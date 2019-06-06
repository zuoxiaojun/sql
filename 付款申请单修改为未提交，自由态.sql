select busistatus，vbillstatus，modifier, modifiedtime   from cmp_apply where vbillno = 'SS18062157'  for update  --    3 1
  /* 付款申请单修改为未提交，自由态*/



select busistatus, vbillstatus, pk_apply
  from cmp_apply
 where vbillno = 'SS19062917'
   and pk_org in (select pk_org from org_orgs where code = '802') --表头
   and dr = 0


select busistatus, vbillstatus
  from cmp_apply_b
 where pk_apply =
       (select pk_apply from cmp_apply where vbillno = 'SS19062917')   --表体

