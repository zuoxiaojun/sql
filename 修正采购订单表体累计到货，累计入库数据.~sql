/*修正采购订单表体累计到货，累计入库数据*/
select nbackarrvnum, nbackstorenum, naccumarrvnum, naccumstorenum
  from po_order_b
 where pk_order = (select pk_order
                     from po_order
                    where vbillcode = '81600CD20180723005'
                      and dr = 0
                      and bislatest = 'Y')
   for update
