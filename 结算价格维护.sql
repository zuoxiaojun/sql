--内部结算清单，结算价格维护错误
--修正上下游结算财务组织和成本域
select cbillid from to_settlelist where vbillcode = '5F20180530115' --for update; --1001D110000000AIIZXX
select crowno,
       cupcostregionid,
       cupfinanceorgid,
       cupfinanceorgvid,
       cdowncostregionid,
       cdownfinanceorgid,
       cdownfinanceorgvid,
       norigtaxprice,
       nexchangerate,                        --汇率
       ccurrencyid,
       nprice,--主本币无税单价
       ninprice  --调入方主本币无税单价                           --1002Z0100000000001K8 美元    --1002Z0100000000001K1  人民币
  from to_settlelist_bb
 where cbillid = '1001D110000000AIKAZY'
 order by CCURRENCYID  for update




