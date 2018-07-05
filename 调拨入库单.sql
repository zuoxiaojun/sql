select a.vbillcode,
       a.caccountperiod,
       b.cinventoryid,
       b.nprice,
       b.nnum,
       b.nmny
  from ia_iibill a
  left join ia_iibill_b b
    on a.cbillid = b.cbillid
 where a.dr = 0
   and b.dr = 0 --µ÷²¦Èë¿âµ¥
   and a.caccountperiod > '2017-12'
