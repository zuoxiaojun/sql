

--��ѯ����δ������������ͬ������
select name, a
  from (select count(name) a, name from bd_cust_supplier group by name)
 where a = 2


select pk_cust_sup, code, name
  from bd_cust_supplier
 where name = '�����ں��²������޹�˾'; --������Ϣ

select pk_supplier, code, name, iscustomer, corcustomer
  from bd_supplier
 where name = '�������Ͷ��ල�����'; --��Ӧ�̻�����Ϣ

select pk_customer, code, name��pk_supplier
  from bd_customer
 where name = '�������Ͷ��ල�����'; --�ͻ�������Ϣ
        
        
        
        
