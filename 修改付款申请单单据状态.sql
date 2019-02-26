--修改付款申请单单据状态
select pk_apply, vbillstatus, busistatus
  from cmp_apply
 where vbillno = 'SS18011938' for update 


select busistatus, vbillstatus
  from cmp_apply_b
 where pk_apply = '1001D1100000008DA86C'
   for update
