select ntotalsendnum, ntotaloutnum, ntotalinvoicenum
  from so_saleorder_exe
 where csaleorderbid in
       (select csaleorderbid
          from so_saleorder_b
         where csaleorderid =
               (select csaleorderid
                  from so_saleorder
                 where vbillcode = '80100XD20180918014')) for update 


select ntotaloutnum
  from so_delivery_b
 where cdeliveryid =
       (select cdeliveryid
          from so_delivery
         where vbillcode = '81600DN20180926003') for update 
