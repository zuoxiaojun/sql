--�޸ĸ������뵥����״̬
select pk_apply, vbillstatus, busistatus,dr
  from cmp_apply
 where vbillno = 'SS19071995' for update 


select busistatus, vbillstatus
  from cmp_apply_b
 where pk_apply = '1001D110000000IBVJHZ'
   for update
