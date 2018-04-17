select nnum,nastnum,ntotalnotoutnum,vchangerate,nqtunitnum
  from so_delivery_b
 where cdeliveryid =
       (select cdeliveryid
          from so_delivery
         where vbillcode = '00812DN20180408001') --for update
