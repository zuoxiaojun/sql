select b.cinventoryid, sum(b.nnum), a.ccustomerid
  from ia_i5bill a
  left join ia_i5bill_b b
    on a.cbillid = b.cbillid
 where a.fintransitflag in ('-1', '1')
   and a.caccountperiod = '2018-05'
   and b.cinventoryid =
       (select pk_material from bd_material where code = '0104120153')
 group by b.cinventoryid, a.ccustomerid


select b.cinventoryid, sum(b.nmny )
  from ia_ijbill a
  left join ia_ijbill_b b
    on a.cbillid = b.cbillid
 where a.fintransitflag in ('-1', '1')
   and a.caccountperiod = '2018-05'
   and b.cinventoryid =
       (select pk_material from bd_material where code = '0104120153')
       and a.dr=0
       and b.dr=0
       and a.pk_org =(select   pk_costregion  from org_costregion where code ='825')   
 group by b.cinventoryid
