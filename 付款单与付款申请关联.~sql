
--付款单与付款申请关联

--先找一条关联对照数据
 select CONTRACTNO,
        TOP_BILLID,
        TOP_BILLTYPE,
        TOP_ITEMID,
        TOP_TERMCH,
        local_money_de
   from ap_payitem
  where billno = '80100FK19040004'
    and dr = 0
--1	GCL\XXJC-CG(B)-2019-0571	1001D110000000GBI90W	36D1	1001D110000000GBI90X	1001B110000000016MJ6	1.00000000


select CONTRACTNO,
       TOP_BILLID,
       TOP_BILLTYPE,
       TOP_ITEMID,
       TOP_TERMCH,
       local_money_de, --构成关联的字段
       dr
  from ap_payitem
 where billno = '80100FK19030159'
   and dr = 0
   for update
     ;
   
   
