--销售成本结转单
select a.vbillcode,
       a.caccountperiod,
       b.cinventoryid,
       b.nprice,
       b.nnum,
       b.nmny
  from ia_i5bill a
  left join ia_i5bill_b b
    on a.cbillid = b.cbillid
 where a.dr = 0
   and b.dr = 0
   

