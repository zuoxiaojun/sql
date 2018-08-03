

--内部结算清单转财务报错：成本域不能为空
select cbillid, cincostregionid, coutcostregionid
  from to_presettlein
 where vsrccode = '80100FR20180730001'
   and dr = 0
 for update

select pk_costregion  from org_costregion where code ='801'--1001D1100000000QYRNK

select cupcostregionid, cdowncostregionid, cbill_bbid
  from to_presettlein_bb
 where cbillid = '1001D110000000BPEAC5'
   and dr = 0

update to_presettlein_bb
   set cdowncostregionid = '1001D1100000000QYRNK'
 where cbillid = '1001D110000000BPEAC5'
   and dr = 0
