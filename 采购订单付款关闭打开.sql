select bpayclose
  from po_order_b
 where pk_org =
       (select pk_purchaseorg from org_purchaseorg where code = '809')
   and bpayclose = 'N'
   and substr(dbilldate, 1, 7) = '2018-02'


update po_order_b
   set bpayclose = 'N'
 where pk_org =
       (select pk_purchaseorg from org_purchaseorg where code = '816')
   and bpayclose = 'Y'
   and substr(dbilldate, 1, 4) = '2017' 


--订单付款关闭打开
update po_order_b
   set bpayclose = 'N'
 where pk_org =
      (select pk_purchaseorg from org_purchaseorg where code = '815')
   and bpayclose = 'Y'
   and substr(dbilldate, 1, 4) = '2018'
   
   --订单付款关闭全部打开 
 update po_order_b set bpayclose = 'N' where bpayclose = 'Y'
  
   
   --订单最终关闭打开
   update po_order
      set bfinalclose = 'N'
    where pk_org =
          (select pk_purchaseorg from org_purchaseorg where code = '815')
      and bfinalclose = 'Y'
      and substr(dbilldate, 1, 4) = '2017'

   --订单最终关闭全部打开
   update po_order set bfinalclose = 'N' where  bfinalclose = 'Y'


