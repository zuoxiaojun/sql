select nnum, nastnum, ntotalnotoutnum, vchangerate, nqtunitnum,vsrcrowno 
  from so_delivery_b
 where cdeliveryid =
       (select cdeliveryid
          from so_delivery
         where vbillcode = '81300DN20181015006')
   for update
