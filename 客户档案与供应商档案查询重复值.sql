--客户档案与供应商档案查询重复值

select name, count(name)
  from bd_cust_supplier
 group by name
having count(name) > 1
select pk_supplier  from bd_customer where name='青岛特锐德电气股份有限公司' 
