select a.cinventoryid, a.nprice, a.nmny, b.ninmny
  from ia_iibill_b a
  left join to_settlelist_bb b
    on a.csrcid = b.cbillid
 where b.cbillid =
       (select cbillid from to_settlelist where vbillcode = '5F20180530100')
   and b.dr = 0
   and a.dr = 0
