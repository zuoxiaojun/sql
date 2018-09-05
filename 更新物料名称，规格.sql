--建立更新表wl


select * from wl

--truncate table wl
--odbc导入数据
--备份原表
create table bd_material_bak0904 as select * from bd_material

select code,name,memo from bd_material_bak0904 where memo like '%PDM%'


--将原名称规格写入备注字段
update bd_material
   set memo = '原名称规格:' || name || materialspec
 where code in (select code from wl)

 update bd_material_v set
 memo = '原名称规格:' || name || materialspec
 where code in (select code from wl)
 
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
 
 
 





