
付款账户->getColValue(bd_bankaccsub,name,PK_BANKACCSUB,payaccount);

/*EPC付款单付款账户数据修复*/

select payaccount
  from ap_payitem
 where pk_paybill =
       (select pk_paybill from ap_paybill where billno = '80501FK18050001')
   for update 
 --1001D1100000009DZLZ4    加拿大元 
--  1001B110000000016097  人民币

/**修复结算单数据*/
 
select accountnum,pk_account from cmp_detail  where pk_detail='1001D110000000A5QVYW'   for update 



