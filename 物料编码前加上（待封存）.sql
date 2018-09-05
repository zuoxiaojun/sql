/*物料编码前加上（待封存）*/
--建立封存数据表fcwl

update bd_material
   set name = '（待封存）' || name 
 where code in
       (select code
          from fcwl
        minus (select code from bd_material where name like '（待封存）%'))--排除原有待封存标记的


update bd_material_v
   set name = '（待封存）' || name
 where code in (select code from bd_material where name like '%待封存%')--更新物料版本

