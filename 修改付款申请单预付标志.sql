select pk_apply, dr
  from cmp_apply
 where vbillno = 'SS19122556'
   and dr = '0' --1001D110000000E6UEY1
   
   select isprepay  from cmp_apply_b where pk_apply = '1001D110000000E6UEY1' for update 
