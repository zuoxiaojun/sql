--修改付款申请单创建人

select cuserid  from sm_user where  user_code ='yy01'

select cuserid  from sm_user where  user_code ='222121'  --1001D1100000008Q251K

select creator, billmaker, vbillno
  from cmp_apply
 where creator = '1001D1100000004ZGACH' --1001D1100000004ZGACH
   and dr = 0


update cmp_apply
   set creator = '1001D1100000008Q251K', billmaker = '1001D1100000008Q251K'
 where creator = '1001D1100000004ZGACH'
   and dr = 0
