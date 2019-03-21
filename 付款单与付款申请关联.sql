
--付款单与付款申请关联

--先找一条关联对照数据
 select CONTRACTNO, TOP_BILLID, TOP_BILLTYPE, TOP_ITEMID, TOP_TERMCH
   from ap_payitem
  where billno = '80200FK19030045'
    and dr = 0
--1	GCL-HYN20181225	1001D110000000G5K8DG	36D1	1001D110000000G5K8DH	1001B110000000016MIB


select CONTRACTNO, TOP_BILLID, TOP_BILLTYPE, TOP_ITEMID, TOP_TERMCH --构成关联的字段
  from ap_payitem
 where billno = '80200FK19030044'
   and dr = 0
   for update
     ;
   
   
