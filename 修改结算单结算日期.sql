select settledate,signdate
  from cmp_settlement
 where billcode = '80501FK18070047'
   for update --2018-07-31 14:33:54

select * from ap_paybill where billno = '80200FK18070042' for update
