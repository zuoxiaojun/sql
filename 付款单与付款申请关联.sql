
--付款单与付款申请关联

--先找一条关联对照数据
 select CONTRACTNO,
        TOP_BILLID,
        TOP_BILLTYPE,
        TOP_ITEMID,
        TOP_TERMCH,
        local_money_de
   from ap_payitem
  where billno = '80100FK19040067'
    and dr = 0 
--31	GCL\XXJC-CG(B)-2019-0541号	1001D110000000GG23NC	36D1	1001D110000000GG23ND	1001D1100000000JTHWK	121115.22000000




select CONTRACTNO,
       TOP_BILLID,
       TOP_BILLTYPE,
       TOP_ITEMID,
       TOP_TERMCH,
       local_money_de, --构成关联的字段
       dr
  from ap_payitem
 where billno = '80100FK19040122'
   and dr = 0
   for update
     ;
   
   
