--采购订单明细价税合计计算与实际金额比对
select a.vbillcode ,    
       b.nnum,
       b. norigtaxprice,
       b.norigtaxmny,
       round((b.nnum * b.norigtaxprice), 2) SJJE,
       b.dbilldate
  from po_order a
  left join po_order_b  b
    on a. pk_order  = b. pk_order 
 where b.dbilldate > '2017-11-01 00:00:00' and a.dr=0
 
 --采购入库单主数量比对
 
 select a.vbillcode, b.nnum, b.vchangerate, b.nassistnum
   from ic_purchasein_h a
   left join ic_purchasein_b b
     on a.cgeneralhid = b.cgeneralhid
  where a.dr = 0
    and a.dbilldate > '2017-11-01 00:00:00'
