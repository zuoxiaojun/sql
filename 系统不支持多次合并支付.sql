
---ϵͳ��֧�ֶ�κϲ�֧��------------------------------------------------------
------------------------------------------------------------------------------

select t.pk_settlement from cmp_settlement t where t.billcode ='80200BX18050130';   

SELECT * FROM  cmp_payment t where t.pk_settlement='0001D1100000003RTWMH';

delete from  t where t.pk_settlement='0001D1100000003RTWMH';
commit; 

delete from cmp_payment
 where pk_settlement =
       (select pk_settlement
          from cmp_settlement
         where billcode = '80200BX18050130');
