--修正采购入库单实收数据
--采购入库单
select nassistnum,nnum ,crowno ,cgeneralbid 
  from ic_purchasein_b
 where cgeneralhid = (select cgeneralhid
                        from ic_purchasein_h
                       where vbillcode = '81900CR20170727004'
                         and dr = 0)
   and dr = 0 for update   --1001D1100000004UFWU9

--库存流水历史
select CROWNO, ninnum, ninassistnum, CGENERALBID
  from ic_flowaccount_his
 where CGENERALBID = '1001D1100000004UFWU9'
   for update
