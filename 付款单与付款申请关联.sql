
--付款单与付款申请关联

--先找一条关联对照数据
 select CONTRACTNO,
        TOP_BILLID,
        TOP_BILLTYPE,
        TOP_ITEMID
   from ap_payitem
  where billno = '80200FK19020039'
    and dr = 0 
    
--3	GCL\XXJC-CG(B)-2019-0515	1001D110000000FVFPGH	36D1	1001D110000000FVFPGI



select CONTRACTNO,
       TOP_BILLID,
       TOP_BILLTYPE,
       TOP_ITEMID,
       --构成关联的字段
       dr
  from ap_payitem
 where billno = '80200FK19050066'
   and dr = 0
   for update
     ;
   
   
