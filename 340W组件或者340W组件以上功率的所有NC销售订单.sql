

select pk_material
  from (select *
          from bd_material
         where materialspec like '%GW%'
           and code like '0105%')
 where substr(materialspec, 8, 3) >= '340'  --ȡ�����Ϲ���ΪGW������ֵ����340��ֵ

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

--��ѯ���۶�����
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
