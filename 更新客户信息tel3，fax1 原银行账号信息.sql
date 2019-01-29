--更新客户信息tel3，fax1 原银行账号信息

select tel3, fax1, a.def5, a.def6, b.name
  from bd_customer a
  left join bd_bankdoc b
    on a.def6 = b.pk_bankdoc
    
   update bd_customer set def11='~'
    
update bd_customer
   set tel3 = def6, fax1 = def5
 where tel3 is null
   and fax1 is null
   
   update bd_customer set def11=def6

create table bd_customer_bak20190124  as select * from bd_customer

merge into bd_customer t1
using bd_bankdoc t2
on (t1.def6 = t2. pk_bankdoc)
when matched then
  update set t1.tel3 = t2.name
  
  select tel3, fax1 from  bd_customer  where fax1<>'-'; 
 
  select tel3,fax1 from bd_customer_bak20190124 where fax1<>'-';
  
  merge into bd_customer a
  using bd_customer_bak20190124 b
  on (a.pk_customer = b.pk_customer)
  when matched then
    update set a.tel3 = b.tel3
 where a.tel3='111'
