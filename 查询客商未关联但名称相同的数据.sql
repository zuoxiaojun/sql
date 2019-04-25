

--查询客商未关联但名称相同的数据
select name, a
  from (select count(name) a, name from bd_cust_supplier group by name)
 where a = 2



select pk_cust_sup, code, name
  from bd_cust_supplier
 where name = '国网安徽省电力有限公司六安供电公司'; --客商信息

select pk_supplier, code, name, iscustomer, corcustomer
  from bd_supplier
 where name = '国网安徽省电力有限公司六安供电公司'; --供应商基本信息  --1001D1100000000TS3CM

select pk_customer, code, name，pk_supplier
  from bd_customer
 where name = '国网安徽省电力有限公司六安供电公司'; --客户基本信息  --1001D110000000CH03KN
        
        
        
        
