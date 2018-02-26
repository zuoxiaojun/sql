--内部结算清单，结算价格维护错误
--修正上下游结算财务组织和成本域
select cbillid from to_settlelist where vbillcode = '5F20180130122'; --1001D1100000008RVSFS
select crowno,
       cupcostregionid,
       cupfinanceorgid,
       cupfinanceorgvid,
       cdowncostregionid,
       cdownfinanceorgid,
       cdownfinanceorgvid,
       norigtaxprice,
       ccurrencyid                              --1002Z0100000000001K8 美元
  from to_settlelist_bb
 where cbillid = '1001D1100000008TQVFX'
 order by CCURRENCYID  for update




