select * from xscbd  --销售成本结转单对应出库单价

--更新销售成本结转单金额=单价*主数量
update ia_i5bill_b
    set nmny=round((nnum*nprice ),6)
  where cbillid = (select cbillid
                     from ia_i5bill
                    where vbillcode = '80100I52018061338'
                      and dr = 0);
                     
--更新单据明细实体 金额=单价*数量
update ia_detailledger
   set nmny=round((nnum*nprice ),6)
 where cbillid = (select cbillid
                    from ia_i5bill
                   where vbillcode = '80100I52018061338'
                     and dr = 0)
