
--视图：v_gcl_icoutitem 跨组织销售结算清单相关销售出库单及结算调入单价
create or replace view v_gcl_icoutitem as
select a.vbillcode vsettlecode,a.cbillid csettleid,bb.cbill_bid csettle_bid,bb.cbill_bbid csettle_bbid,a.dbilldate,a.dfidate,
       b.vfirstcode,b.cfirstid,b.cfirstbid,
       b.vsrccode voutcode,b.csrcid coutid,b.csrcbid coutitemid,bb.norigprice nprice 
from to_settlelist_bb bb
left join to_settlelist a on a.cbillid = bb.cbillid
left join to_settlelist_b b on b.cbill_bid = bb.cbill_bid
where a.dr = 0 and b.dr = 0 and bb.dr = 0
and b.fsettletypeflag = 3
and a.btransfiflag ='Y'
and b.vsrctype = '4C'
and a.ctargetfiorgid = '0001D11000000007DSO7'
and bb.cdownfinanceorgid = '0001D11000000007DSO7'
and bb.cdowncostregionid = '1001D1100000000QYRNK';

--视图：v_gcl_i5itemupdate 需要更新的i5item
create or replace view v_gcl_i5itemupdate as
select a.caccountperiod,a.pk_org,a.vbillcode,a.cbillid,b.cbill_bid,b.vsrctype,b.vsrccode,b.csrcid,b.csrcbid,b.cicitemid,
       v.vsettlecode,v.csettleid,v.csettle_bid,v.csettle_bbid,v.voutcode,v.coutid,v.coutitemid,v.dfidate,
       b.nnum,v.nprice,b.nnum*v.nprice nmny
from ia_i5bill_b b
left join ia_i5bill a on a.cbillid = b.cbillid
left join v_gcl_icoutitem v on b.cicitemid = v.coutitemid
where a.dr = 0 and b.dr = 0 
and a.pk_org = '1001D1100000000QYRNK'
and b.pk_org = '1001D1100000000QYRNK'
and a.fintransitflag = 0
and b.nprice is null
and v.nprice is not null;

--更新ia_detailledger 92rows
update ia_detailledger a set (a.nprice,a.nmny) = (select v.nprice,nvl(v.nprice,0)*nvl(a.nnum,0) nmny from v_gcl_i5itemupdate v where a.cbill_bid = v.cbill_bid)
where a.dr = 0 and exists (select 1 from v_gcl_i5itemupdate v where a.cbill_bid = v.cbill_bid);

--更新存货核算I5 销售成本结转 168rows
update ia_i5bill_b b set (b.nprice,b.nmny) = (select v.nprice,nvl(v.nprice,0)*nvl(b.nnum,0) nmny from v_gcl_icoutitem v where b.cicitemid = v.coutitemid)
where b.dr = 0 and b.pk_org = '1001D1100000000QYRNK' and b.nprice is null 
and exists (select 1 from v_gcl_icoutitem v where b.cicitemid = v.coutitemid);
