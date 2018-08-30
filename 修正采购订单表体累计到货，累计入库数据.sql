/*修正采购订单表体累计到货，累计入库数据*/
select nbackarrvnum, nbackstorenum, naccumarrvnum, naccumstorenum,naccuminvoicenum 
  from po_order_b
 where pk_order = (select pk_order
                     from po_order
                    where vbillcode = 'GCL/ZJGJC-CG/YFL20180074-004'
                      and dr = 0
                      and bislatest = 'Y')
   for update
