select * from ap_payitem where billno ='80100FK19010084' and dr=0

select TOP_TERMCH
  from ap_payitem
 where billno = '80100FK18110129'
   and contractno = 'GCL/XXJC-NBJY-2018-0211'


--付款单与付款申请关联
select CONTRACTNO, TOP_BILLID, TOP_BILLTYPE, TOP_ITEMID, TOP_TERMCH
  from ap_payitem
 where billno = '80100FK19010084'
   and dr = 0
   for update
   
