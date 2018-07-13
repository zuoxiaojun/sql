--调拨出库单
select a.pk_org,
       a.caccountperiod,
       a.vbillcode,
       b.cinventoryid,
       b.nnum,
       b.nprice,
       b.nmny,
       b.vsrccode
  from ia_ijbill a
  left join ia_ijbill_b b
    on a.cbillid = b.cbillid
 where a.caccountperiod = '2018-06'
   and a.pk_org =
       (select pk_costregion from org_costregion where code = '801')
   and a.dr = 0
   and b.dr = 0
   and b.vsrccode like '5F%'
       
--调拨入库单       
select a.pk_org,
       a.caccountperiod,
       a.vbillcode,
       b.cinventoryid,
       b.nnum,
       b.nprice,
       b.nmny,
       b.vsrccode
  from ia_iibill a
  left join ia_iibill_b b
    on a.cbillid = b.cbillid
 --where a.caccountperiod = '2018-05'
   and a.pk_org =
       (select pk_costregion from org_costregion where code = '801')
   and a.dr = 0
   and b.dr = 0
   and b.vsrccode ='5F20180518043'
   --and a.vbillcode='80100II2018050397'
