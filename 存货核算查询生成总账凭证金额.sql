--存货核算查询生成总账凭证金额

select a.pk_org,
       a.caccountperiod,
       a.cbilltypecode,
       a.vbillcode,
       a.cinventoryid,
       a.nprice,
       a.nnum,
       a.nmny,
       b.src_freedef1,
       b.des_freedef1,
       b.des_freedef3
  from ia_detailledger a
  left join fip_relation b
    on a.vbillcode = b.src_freedef1
 where a.dr = 0
   and a.vbillcode = '80100I52018050905'
--and a.caccountperiod = '2018-08'
and a.cbilltypecode='I5'
