

   
   --订单付款关闭全部打开
    
 select * from po_order_b where bpayclose = 'Y';
 
 update po_order_b set bpayclose = 'N' where bpayclose = 'Y'
  
   

--订单最终关闭全部打开

  select * from po_order where  bfinalclose = 'Y';
   
  update po_order set bfinalclose = 'N' where bfinalclose = 'Y'
  
  
  select *  from user_jobs
  
  
  
select (SYSDATE+360/(24*60)) from dual

