select *
  from ct_payplan
 where pk_ct_pu =
       (select pk_ct_pu
          from ct_pu
         where vbillcode = 'GCLXXJC-CG(B)-2018-0016-2')  for update ;
         
         select isprepay  from cmp_apply_b where pk_apply =(select pk_apply  from cmp_apply where vbillno  ='SS18030096') for update 
