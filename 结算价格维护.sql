--内部结算清单，结算价格维护错误
--修正上下游结算财务组织和成本域
select cbillid from to_settlelist where vbillcode = '5F20180125073'; --1001D1100000008RVSFS
select crowno,
       cupcostregionid,
       cupfinanceorgid,
       cupfinanceorgvid,
       cdowncostregionid,
       cdownfinanceorgid,
       cdownfinanceorgvid,
       ccurrencyid                              --1002Z0100000000001K8 美元
  from to_settlelist_bb
 where cbillid = '1001D1100000008RVSFS'
 order by CCURRENCYID  for update

select code, name, pk_costregion
  from org_costregion
 where pk_costregion in ('1001B1100000000CTXFO',
                         '1001D1100000000QYRNK',
                         '1001B11000000008VE7Z'); --成本域
 
select code, vname, pk_vid
  from org_financeorg_v
 where pk_vid in ('0001B11000000000T16F',
                  '0001D11000000007DSO6',
                  '0001B11000000000YALH'); --财务组织版本

select code, pk_financeorg
  from org_financeorg
 where pk_financeorg in ('0001B11000000000T16G',
                         '0001D11000000007DSO7',
                         '0001B11000000000YALI'); --财务组织







