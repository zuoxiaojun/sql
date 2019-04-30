/*
内部结算清单转财务提示成本域不能为空，
原因：to_presettlein_bb 调入成本域字段cincostregionid为空
推测是新加仓库后没有把该仓库加到成本域中
将调入成本域字段补上后，成本域添加仓库即可
*/
select cgeneralhid
  from ic_transout_h
 where vbillcode = '80200DC20190416001'


--待结算调出单
select coutcostregionid, --调出成本域
cincostregionid --调入成本域
  from to_presettleout
 where csrcid = '1001D110000000GUBNBH'

--待结算调入单

select cgeneralhid  from ic_transin_h where vbillcode ='80100FR20190416001' --1001D110000000GUBNCQ
select cgeneralhid  from ic_transin_h where vbillcode ='80100FR20190416002' --1001D110000000GUBND1

select  pk_costregion  from  org_costregion where code='801' --1001D1100000000QYRNK

select cbillid,
       coutcostregionid, --调出成本域
       cincostregionid, ----调入成本域
       cinstordocid --调入仓库
  from to_presettlein
 where csrcid in ('1001D110000000GUBNCQ', '1001D110000000GUBND1')
for update 
  
 
--待结算调入单子子实体
select cupcostregionid, --上游成本域
       cdowncostregionid --下游成本域
  from to_presettlein_bb
 where cbillid in ('1001D110000000GUBNDW', '1001D110000000GUBNE1')
   for update
