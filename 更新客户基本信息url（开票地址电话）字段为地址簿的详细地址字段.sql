select count(*)  from  bd_customer where corpaddress<>'~'

--更新客户基本信息url（开票地址电话）字段为地址簿的详细地址字段
update bd_customer a
   set a.url =
       (select b.detailinfo
          from bd_address b
         where a.corpaddress = b. pk_address)
 where exists (select 1 from bd_address b  where a.corpaddress = b.pk_address)
 and a.corpaddress <>'~'


 
 
 
