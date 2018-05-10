
--供应商价目表表同一物料取出最新价格
select pk_material, nastorigtaxprice, nastorigprice, tcreatetime
  from purp_supplierprice
 where tcreatetime in (select ts
                         from (select max(tcreatetime) ts, pk_material
                                 from purp_supplierprice
                                group by pk_material))
                                
   select * from purp_supplierprice
