

select pk_material
  from (select *
          from bd_material
         where materialspec like '%GW%'
           and code like '0105%')
 where substr(materialspec, 8, 3) >= '340'  --取出物料规则为GW并且数值大于340的值

select csaleorderid 
  from so_saleorder_b
 where cmaterialid in
       (select pk_material
          from (select *
                  from bd_material
                 where materialspec like '%GW%'
                   and code like '0105%')
         where substr(materialspec, 8, 3) >= '340')
and dr=0

--查询销售订单号
select vbillcode
  from so_saleorder
 where csaleorderid in (select csaleorderid
                          from so_saleorder_b
                         where cmaterialid in
                               (select pk_material
                                  from (select *
                                          from bd_material
                                         where materialspec like '%GW%'
                                           and code like '0105%')
                                 where substr(materialspec, 8, 3) >= '340')
                           and dr = 0)
   and dr = 0
