select code,name,pk_supplierclass,pk_org   from bd_supplier where code ='G000016'

select code , pk_supplierclass ,name  from bd_supplierclass  where name='成本类供应商'

select distinct(pk_supplierclass) from bd_supplier


select dataoriginflag,pk_org from bd_cust_supplier where code ='G000016' --0001W210000000000A1O

--查询分类不在集团的
select pk_org,code,name from bd_supplier where pk_supplierclass not in 
(select pk_supplierclass from bd_supplierclass where code in ('01','02','03','04'))

select name ,pk_org from org_orgs where pk_org='0001S31000000000CIN1'

--更新供应商所属组织 bd_supplier

update bd_supplier set pk_org ='0001W210000000000A1O' where pk_org<>'0001W210000000000A1O'

--更新客商表所属组织 

update bd_cust_supplier set pk_org ='0001W210000000000A1O' where pk_org<>'0001W210000000000A1O'


select distinct(pk_org) from bd_supplier


--查询名称重复的供应商

select name ,count(name)  num from bd_supplier group by name having count(name)>1
 




