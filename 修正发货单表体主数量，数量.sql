select nnum, nastnum, ntotalnotoutnum, vchangerate, nqtunitnum
  from so_delivery_b
 where cdeliveryid =
       (select cdeliveryid
          from so_delivery
         where vbillcode = '81200DN20180914001')
   for update
