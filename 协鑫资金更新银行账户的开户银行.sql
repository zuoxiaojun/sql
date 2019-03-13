select code, name from bd_asslinenum  --人行联行信息

select code,name from bd_asslinenum --人行联行信息


select count(*) from bd_bankdoc  --银行

--银行编码长度不等于12位的
select pk_bankdoc, code, name
  from bd_bankdoc
 where length(code) <> 12

  
 
 /*查询银行账户中引用了编码长度不等于12位的银行的数据*/
select a.pk_bankaccbas, a.accname, a.accnum, a.pk_bankdoc, b.name
  from bd_bankaccbas a
  left join bd_bankdoc b
    on a. pk_bankdoc = b. pk_bankdoc
 where a.pk_bankdoc in
       (select pk_bankdoc from bd_bankdoc where length(code) <> 12)
   and a.dr = 0
   and a.accclass =2  --账户分类
   
   
   create or replace view v_bank_notin as 
 select a.pk_bankdoc
   from bd_bankaccbas a
   left join bd_bankdoc b
     on a. pk_bankdoc = b. pk_bankdoc
  where a.pk_bankdoc in
        (select pk_bankdoc from bd_bankdoc where length(code) <> 12)
    and a.dr = 0
    and a.accclass = 2
    
    
    select pk_bankdoc, code, name from bd_bankdoc
    
    
   --创建修改中间数据表，记录正确的银行账户的银行值 
    create table yhdata (
    PK_BANKACCBAS varchar2(255),
    ACCNAME varchar2(255),
    ACCNUM varchar2(255),
    new_PK_BANKDOC varchar2(20)  
    
    )
    ;
   select * from  yhdata;
    
   
   --更新银行账户的开户银行值
   merge into bd_bankaccbas a
   using yhdata b
   on (a.PK_BANKACCBAS = b.PK_BANKACCBAS)--按照银行账户pk匹配
   when matched then
     update set a.pk_bankdoc = b.new_pk_bankdoc
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
