
�����˻�->getColValue(bd_bankaccsub,name,PK_BANKACCSUB,payaccount);

select pk_paybill,modifier,modifiedtime from ap_paybill where billno='80501FK18040003' for update

/*EPC��������˻������޸�*/

select payaccount
  from ap_payitem
 where pk_paybill =
       (select pk_paybill from ap_paybill where billno = '80501FK18040043')
   for update 
 --1001D1100000009DZLZ4    ���ô�Ԫ 
--  1001B110000000016097  �����


select accnum,pk_bankaccsub from  bd_bankaccsub  where  pk_bankaccsub ='1001D1100000009DZLZ4'

