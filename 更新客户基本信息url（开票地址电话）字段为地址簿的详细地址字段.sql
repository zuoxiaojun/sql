select count(*)  from  bd_customer where corpaddress<>'~'

--���¿ͻ�������Ϣurl����Ʊ��ַ�绰���ֶ�Ϊ��ַ������ϸ��ַ�ֶ�
update bd_customer a
   set a.url =
       (select b.detailinfo
          from bd_address b
         where a.corpaddress = b. pk_address)
 where exists (select 1 from bd_address b  where a.corpaddress = b.pk_address)
 and a.corpaddress <>'~'


 
 
 
