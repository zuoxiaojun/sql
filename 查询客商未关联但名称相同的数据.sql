

--��ѯ����δ������������ͬ������
select name, a
  from (select count(name) a, name from bd_cust_supplier group by name)
 where a = 2



select pk_cust_sup, code, name
  from bd_cust_supplier
 where name = '��������ʡ�������޹�˾�������繫˾'; --������Ϣ

select pk_supplier, code, name, iscustomer, corcustomer
  from bd_supplier
 where name = '��������ʡ�������޹�˾�������繫˾'; --��Ӧ�̻�����Ϣ  --1001D1100000000TS3CM

select pk_customer, code, name��pk_supplier
  from bd_customer
 where name = '��������ʡ�������޹�˾�������繫˾'; --�ͻ�������Ϣ  --1001D110000000CH03KN
        
        
        
        
