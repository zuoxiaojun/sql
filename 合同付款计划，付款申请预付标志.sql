select bpreflag
  from ct_payplan
 where pk_ct_pu =
       (select pk_ct_pu
          from ct_pu
         where vbillcode = 'GCL/XXJC-XMBU-2018-030501')  for update ;
         
         select isprepay  from cmp_apply_b where pk_apply =(select pk_apply  from cmp_apply where vbillno  ='SS18030096') for update 
