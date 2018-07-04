select pk_customer  from bd_customer where name ='SHARP Electronics GmbH' --客户主键   1001D1100000000PKEX7


select code, name
  from bd_customer
 where pk_customer = '1001D1100000002PWD3U'    

select def2,def3 from ar_gatherbill where billno ='81800SK18040007'  for update  --收款单客户,合同号  --1001D1100000002PWD3U

select  pk_customer  from ct_sale where vbillcode ='GCL/XMBU-XSSW-2017-0950号'  --1001D1100000000PKEX7

select  customer   from  ar_recitem where customer='1001D1100000000PKEX7'  --应收单查询

