select crowno, nnum, nastnum, nprice, nmny
  from ia_iibill_b
 where cbillid =
       (select cbillid from ia_iibill where vbillcode = '80100II2018010167' and dr=0) for update  --调拨入库单
       
       
       
       select nnum, nprice, nmny, cbill_bid 
         from ia_i2bill_b
        where cbillid = (select cbillid
                           from ia_i2bill
                          where vbillcode = '80900I22018060610') for update --采购入库单



select crowno, nnum, nastnum, nprice, nmny,cbill_bid
  from ia_ijbill_b
 where cbillid  =
       (select cbillid from ia_ijbill where vbillcode = '81600IJ201806270255' and dr=0) for update   --调拨出库单




select nnum, nprice, nmny
  from ia_detailledger
 where cbill_bid  = '1001D110000000AVH8SV' for update  --单据明细实体
