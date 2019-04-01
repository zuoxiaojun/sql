
---系统不支持多次合并支付------------------------------------------------------
------------------------------------------------------------------------------

select t.pk_settlement from cmp_settlement t where t.billcode ='80200JK19010069';   

SELECT paystatus,pk_settlement , serial   FROM  cmp_payment t where t.pk_settlement='0001D1100000008TUAPR';

delete from cmp_payment t where t.pk_settlement='0001D110000000993252';
commit; 

delete from cmp_payment
 where pk_settlement =
       (select pk_settlement
          from cmp_settlement
         where billcode = '80200BX19030308');
