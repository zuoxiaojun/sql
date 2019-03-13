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
   
   
   
  
   
   
   
