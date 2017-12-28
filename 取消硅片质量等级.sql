select *
  from ic_material_b
 where cgeneralhid =
       (select cgeneralhid
          from ic_material_h
         where vbillcode = '80900CC20171214037')  --1001B1100000000095SO
         
         
         select name from bd_defdoc where pk_defdoc='1001B1100000000095SO'
         
         select pk_marasstframe  from bd_material_v where  code='0103020056' for update
