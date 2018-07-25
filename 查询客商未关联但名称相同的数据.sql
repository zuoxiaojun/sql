

--查询客商未关联但名称相同的数据
select name, a
  from (select count(name) a, name from bd_cust_supplier group by name)
 where a = 2


select pk_cust_sup, code, name
  from bd_cust_supplier
 where name = '江苏亿和新材料有限公司'; --客商信息

select pk_supplier, code, name, iscustomer, corcustomer
  from bd_supplier
 where name = '舒城县招投标监督管理局'; --供应商基本信息

select pk_customer, code, name，pk_supplier
  from bd_customer
 where name = '舒城县招投标监督管理局'; --客户基本信息
        
        
        
        
