
---ϵͳ��֧�ֶ�κϲ�֧��------------------------------------------------------
------------------------------------------------------------------------------

select t.pk_settlement from cmp_settlement t where t.billcode ='80501BX19020008';   

SELECT paystatus,pk_settlement , serial   FROM  cmp_payment t where t.pk_settlement='0001D110000000977ZAP';

delete from cmp_payment t where t.pk_settlement='0001D110000000993252';
commit; 

delete from cmp_payment
 where pk_settlement =
       (select pk_settlement
          from cmp_settlement
         where billcode = '80501BX19020008');
