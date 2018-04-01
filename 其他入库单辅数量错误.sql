
/*其他入库单辅数量错误*/
select cgeneralhid  from  ic_generalin_h where vbillcode ='TR20171115014'   --1001D1100000007I7977

select nnum, nassistnum, cgeneralbid
  from ic_generalin_b
 where cgeneralhid = '1001D1100000007I7977'
   for update --1001D1100000007I7979   修改其他入库单表体

 select ninassistnum, ninnum, nneedinassistnum, nshouldinnum
   from ic_flowaccount_his
  where cgeneralbid = '1001D1100000007I7979' for update --修改库存流水历史
