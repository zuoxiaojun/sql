
付款账户->getColValue(bd_bankaccsub,name,PK_BANKACCSUB,payaccount);

select pk_paybill,modifier,modifiedtime from ap_paybill where billno='80501FK18040003' for update

/*EPC付款单付款账户数据修复*/

select payaccount
  from ap_payitem
 where pk_paybill = (select pk_paybill
                       from ap_paybill
                      where billno = '80501FK18040006') for update   --1001B110000000016097    
