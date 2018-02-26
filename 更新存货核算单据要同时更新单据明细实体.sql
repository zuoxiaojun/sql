select crowno, nnum, nastnum, nprice, nmny
  from ia_iibill_b
 where cbillid =
       (select cbillid from ia_iibill where vbillcode = '80100II2018010167' and dr=0) for update  --调拨入库单

select nnum, nprice, nmny
  from ia_detailledger
 where cbillid = '1001D1100000008W7IKU' for update  --单据明细实体
