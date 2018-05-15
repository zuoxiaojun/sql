
--80501财务核算账簿所属物料批量启用批次核算

select batchcost, costmode
  from bd_materialcostmod
 where pk_setofbook = (select pk_accountingbook
                         from org_accountingbook
                        where code = '80501-XXJC')
   and pk_material in
       (select pk_material
          from bd_materialstock
         where wholemanaflag = 'Y'
           and pk_org =
               (select pk_stockorg from org_stockorg where code = '80501'))  --筛选库存信息勾选批次管理


update bd_materialcostmod
   set batchcost = 'Y'
 where pk_setofbook = (select pk_accountingbook
                         from org_accountingbook
                        where code = '80501-XXJC')
   and pk_material in
       (select pk_material
          from bd_materialstock
         where wholemanaflag = 'Y'
           and pk_org =
               (select pk_stockorg from org_stockorg where code = '80501'))
