/*查询会计期间与单据日期不匹配的单据 */
/*--销售成本结转单*/
select a. pk_org ,
       a.caccountperiod,
       substr(a.dbilldate,1,10)   dbilldate,
       a.vbillcode,
       b.cinventoryid,
       b.nnum,
       b.nprice,
       b.nmny
  from ia_i5bill a
  left join ia_i5bill_b b
    on a.cbillid = b.cbillid
 where a.caccountperiod <> substr(a.dbilldate, 1, 7)
   and a.fintransitflag in ('-1', '1')
and a.dr=0
and b.dr=0
/*--调拨出库单*/
union all
select a. pk_org ,
       a.caccountperiod,
       substr(a.dbilldate,1,10)  dbilldate,
       a.vbillcode,
       b.cinventoryid,
       b.nnum,
       b.nprice,
       b.nmny
  from ia_ijbill a
  left join ia_ijbill_b b
    on a.cbillid = b.cbillid
 where a.caccountperiod <> substr(a.dbilldate, 1, 7)
   and fintransitflag in ('-1', '1')
 and a.dr=0
and b.dr=0

