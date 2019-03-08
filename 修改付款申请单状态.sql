select busistatus, vbillstatus, APPLYDATE,modifiedtime,modifier, pk_apply 
  from cmp_apply
 where vbillno = 'SS17050335'  and dr =0 for update

select busistatus,
       vbillstatus,
       olcrate  
  from cmp_apply_b
 where pk_apply ='1001D11000000029KKCR'
   for update


