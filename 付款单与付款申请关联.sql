
--付款单与付款申请关联

--先找一条关联对照数据
 select CONTRACTNO, TOP_BILLID, TOP_BILLTYPE, TOP_ITEMID, TOP_TERMCH
   from ap_payitem
  where billno = '80100FK19030074'
    and dr = 0
--1	GCL\XXJC-CG(B)-2018-0083号	1001D110000000G6LLTX	36D1	1001D110000000G6LLTY	1001B110000000016MIS


select CONTRACTNO, TOP_BILLID, TOP_BILLTYPE, TOP_ITEMID, TOP_TERMCH --构成关联的字段
  from ap_payitem
 where billno = '80100FK19030073'
   and dr = 0
   for update
     ;
   
   
