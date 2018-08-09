
--修改存货调拨入库单单价金额
select nnum,nprice,nmny from ia_iibill_b where cbill_bid='1001D110000000BQSAMM' for update 
--1	840.00000000	710.05920200	596449.73000000



select nprice, nnum, nmny,cbill_bid
  from ia_i2bill_b
 where cbillid =
       (select cbillid from ia_i2bill where vbillcode = '82500I22018070097')  --1	648.66962920	18000.00000000	11676053.32560000

   for update

select nnum, nprice, nmny
  from ia_detailledger
 where cbill_bid = '1001D110000000BJKTI0' for update   --单据明细实体
