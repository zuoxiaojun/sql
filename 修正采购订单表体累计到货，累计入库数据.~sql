/*修正采购订单表体累计到货，累计入库数据*/
select nbackarrvnum, nbackstorenum, naccumarrvnum, --累计到货主数量
naccumstorenum,--累计入库主数量
naccuminvoicenum --累计开票主数量
  from po_order_b
 where pk_order = (select pk_order
                     from po_order
                    where vbillcode = '81600CD20171123012'
                      and dr = 0
                      and bislatest = 'Y')
   for update
