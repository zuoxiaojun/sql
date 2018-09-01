select * from wl

--更新物料名称
update bd_material a
   set a.name =
       (select b.name from wl b where a.code = b.code)
 where exists (select 1 from wl b where a.code = b.code);

update bd_material_v a
   set a.name =
       (select b.name from wl b where a.code = b.code)
 where exists (select 1 from wl b where a.code = b.code);

--更新物料规格
update bd_material a
   set a.materialspec =
       (select b.guige from wl b where a.code = b.code)
 where exists (select 1 from wl b where a.code = b.code);

update bd_material_v a
   set a.materialspec =
       (select b.guige from wl b where a.code = b.code)
 where exists (select 1 from wl b where a.code = b.code);

--物料编码前加上（待封存）
update bd_material
   set name = '（待封存）' || name 
 where code in
       (select code
          from fcwl
        minus (select code from bd_material where name like '（待封存）%'))--排除原有待封存标记的


update bd_material_v
   set name = '（待封存）' || name
 where code in
       (select code
          from fcwl
        minus (select code from bd_material where name like '（待封存）%'))






