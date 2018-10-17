select busistatus, vbillstatus, APPLYDATE,modifiedtime,modifier
  from cmp_apply
 where vbillno = 'SS18090067' for update

select busistatus,
       vbillstatus,
       olcrate  
  from cmp_apply_b
 where pk_apply =
       (select pk_apply from cmp_apply where vbillno = 'SS18090067')
   for update
