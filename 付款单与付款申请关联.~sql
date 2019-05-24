
--付款单与付款申请关联

--先找一条关联对照数据
 select CONTRACTNO,
        TOP_BILLID,
        TOP_BILLTYPE,
        TOP_ITEMID
   from ap_payitem
  where billno = '80100FK19050047'
    and dr = 0 
    
--1	GCL\XXJC-CG(B)-2019-0022号	1001D110000000H1ZQ87	36D1	1001D110000000H1ZQ88


select CONTRACTNO,
       TOP_BILLID,
       TOP_BILLTYPE,
       TOP_ITEMID,
       --构成关联的字段
       dr
  from ap_payitem
 where billno = '80100FK19050046'
   and dr = 0
   for update
     ;
   
   
