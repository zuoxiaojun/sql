
--修改存货调拨入库单单价金额
select nnum,nprice,nmny from ia_iibill_b where cbill_bid='1001D110000000AI944H' for update 

select nnum, nprice, nmny
  from ia_detailledger
 where cbill_bid = '1001D110000000AI944G' for update   --单据明细实体
