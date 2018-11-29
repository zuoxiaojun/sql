select def26
  from ap_payitem
 where pk_paybill =
       (select pk_paybill from ap_paybill where billno = '81500FK18110021')
   for update
