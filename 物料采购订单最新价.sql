
--物料采购订单最新价
select pk_srcmaterial, nqtorigtaxprice, dbilldate
  from po_order_b
 where dbilldate in (select dbilldate
                       from (select pk_srcmaterial, max(dbilldate) dbilldate
                               from po_order_b
                               where   pk_srcmaterial='&pk_srcmaterial'                        
                              group by pk_srcmaterial))
   and pk_srcmaterial ='&pk_srcmaterial'
   


