--�ͻ������빩Ӧ�̵�����ѯ�ظ�ֵ

select name, count(name)
  from bd_cust_supplier
 group by name
having count(name) > 1
select pk_supplier  from bd_customer where name='�ൺ����µ����ɷ����޹�˾' 
