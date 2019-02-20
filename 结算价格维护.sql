--内部结算清单，结算价格维护错误
--修正上下游结算财务组织和成本域
select cbillid from to_settlelist where vbillcode = '5F20190219040' --for update; --1001D110000000FR5PJC

select crowno,
       cupcostregionid, --上游成本域
       cupfinanceorgid, --上游财务组织最新版本
       cupfinanceorgvid, --上游财务组织
       cdowncostregionid, --下游成本域
       cdownfinanceorgid, --下游财务组织最新版本
       cdownfinanceorgvid, --下游财务组织 
       norigtaxprice, --结算币种含税单价 
       nexchangerate, --汇率
       ninexchangerate, --调入方折本汇率 
       ccurrencyid, --结算币种
       nprice, --主本币无税单价
       ninprice --调入方主本币无税单价                           --1002Z0100000000001K8 美元    --1002Z0100000000001K1  人民币
  from to_settlelist_bb --1002Z0100000000001K3  欧元
 where cbillid = '1001D110000000FR5PJC'
 --order by CCURRENCYID  for update
 and cupfinanceorgvid =(select  pk_vid  from org_financeorg_v where code='813')  --上游财务组织
  for update 




