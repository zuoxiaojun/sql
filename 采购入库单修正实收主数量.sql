--采购入库单修正实收主数量

--采购入库单
select cmaterialvid, nnum, nassistnum, cgeneralbid --1001D1100000006K2G69
  from ic_purchasein_b
 where cgeneralhid =
       (select cgeneralhid
          from ic_purchasein_h
         where vbillcode = '81300CR20170926040')
   for update


--库存流水历史
select ninassistnum, pk_flow,ccorrespondbid
  from ic_flowaccount_his
 where vbillcode = '81300CR20170926040'
 for update 
   
 
 
