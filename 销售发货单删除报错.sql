select ntotalsendnum,--¿€º∆∑¢ªı
ntotaloutnum
  from so_saleorder_exe
 where csaleorderbid in
       (select csaleorderbid
          from so_saleorder_b
         where csaleorderid =
               (select csaleorderid
                  from so_saleorder
                 where vbillcode = '80100XD20171206015')) and dr=0  for update
                 
    select *
      from so_delivery_b
     where cdeliveryid =
           (select cdeliveryid
              from so_delivery
             where vbillcode = '00812DN20171207002')
