select nnum, nastnum, ntotalnotoutnum, vchangerate, nqtunitnum
  from so_delivery_b
 where cdeliveryid =
       (select cdeliveryid
          from so_delivery
         where vbillcode = '81300DN20180608007')
   for update
