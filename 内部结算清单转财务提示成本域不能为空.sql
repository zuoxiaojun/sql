/*
内部结算清单转财务提示成本域不能为空，
原因：to_presettlein_bb 调入成本域字段cdowncostregionid为空
推测是新加仓库后没有把该仓库加到成本域中
将调入成本域字段补上后，成本域添加仓库即可
*/


select  pk_costregion  from  org_costregion where code='801' --1001D1100000000QYRNK
 

--待结算调入单子子实体

select cupcostregionid, --上游成本域
       cdowncostregionid --下游成本域      
  from to_presettlein_bb
 where cbillid in (select cbillid
                     from to_presettlein
                    where vsrccode = '80100FR20190514001') for update 
                           
 --待结算调出单子子实体
 
select cupcostregionid, cdowncostregionid
  from to_presettleout_bb
 where cbillid in (select cbillid
                     from to_presettleout
                    where vsrccode = '80100FR20190514001')
   for update --1001D1100000000QYRNK
 
 
 
 
 
