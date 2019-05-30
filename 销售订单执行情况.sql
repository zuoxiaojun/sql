
--销售订单执行情况
select ntotalsendnum, ntotaloutnum, ntotalinvoicenum
  from so_saleorder_exe
 where csaleorderbid in
       (select csaleorderbid
          from so_saleorder_b
         where csaleorderid =
               (select csaleorderid
                  from so_saleorder
                 where vbillcode = '82500XD20190426003'))

   for update
