/*物料名称前加上（待封存）*/
--建立封存数据表fcwl

select * from fcwl


/*更新物料*/

update bd_material
   set name = '（待封存）' || name 
 where code in
       (select code
          from fcwl
        minus (select code from bd_material where name like '（待封存）%'))--排除原有待封存标记的



/*更新物料版本*/
update bd_material_v
   set name = '（待封存）' || name 
 where code in
       (select code
          from fcwl
        minus (select code from bd_material_v where name like '（待封存）%'))--排除原有待封存标记的

