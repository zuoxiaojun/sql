select code, name
  from bd_supplier
 where pk_country <> '0001Z010000000079UJJ'; --��Ӧ�̹��ҵ������й�
select code, name
  from bd_customer
 where pk_country <> '0001Z010000000079UJJ' --�ͻ����ҵ������й�


select pk_country ,name  from bd_countryzone  where name='�й�';

update bd_supplier
   set pk_country = '0001Z010000000079UJJ'
 where pk_country <> '0001Z010000000079UJJ';

update bd_customer
   set pk_country = '0001Z010000000079UJJ'
 where pk_country <> '0001Z010000000079UJJ'
