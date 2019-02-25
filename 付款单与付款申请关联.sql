
--付款单与付款申请关联
select CONTRACTNO, TOP_BILLID, TOP_BILLTYPE, TOP_ITEMID, TOP_TERMCH --构成关联的字段
  from ap_payitem
 where billno = '80200FK19020027'
   and dr = 0
   for update
     ;
   
   select CONTRACTNO, TOP_BILLID, TOP_BILLTYPE, TOP_ITEMID, TOP_TERMCH  
  from ap_payitem
 where billno = '80200FK19010090'
   and dr = 0
