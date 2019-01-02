
---系统不支持多次合并支付------------------------------------------------------
------------------------------------------------------------------------------

select t.pk_settlement from cmp_settlement t where t.billcode ='80501BX18100212';   

SELECT * FROM  cmp_payment t where t.pk_settlement='0001D1100000003RTWMH';

delete from  t where t.pk_settlement='0001D1100000003RTWMH';
commit; 

delete from cmp_payment
 where pk_settlement =
       (select pk_settlement
          from cmp_settlement
         where billcode = '80200CL18120931');
