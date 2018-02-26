select cgeneralhid from ic_generalin_h where vbillcode='TR20171018027'--1001D110000000731AAW

select cgeneralbid,pk_batchcode,vbatchcode,nnum from ic_generalin_b where cgeneralhid='1001D110000000731AAW' for update--其他入库单

select cgeneralhid from ic_generalout_h where vbillcode='81300TC20171018011' --1001D110000000731A9A
select cgeneralbid,nnum, vbatchcode, pk_batchcode
  from ic_generalout_b 
 where cgeneralhid = '1001D110000000731A9A' for update  --其他出库单  1001D110000000731A9D

select  vbatchcode,pk_batchcode from ic_flowaccount_his  where dr = 0 and CGENERALBID = '1001D110000000731AAZ' for update--库存流水表
