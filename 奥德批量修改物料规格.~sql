select distinct(def3) from bd_material 
--将原规格数据保存到def3字段备查

update bd_material set def3=materialspec  ;
update bd_material_v set def3=materialspec;

-- Create table   创建中间数据表

create table GGBG
(
  code             VARCHAR2(255),
  name             VARCHAR2(255),
  new_materialspec VARCHAR2(255)
)

--obdc导入数据

select * from ggbg

--更新物料档案规格数据
update bd_material a
   set a.materialspec =
       (select b.new_materialspec from ggbg b where a.code = b.code)
 where exists (select 1 from ggbg b where a.code = b.code)

--更新物料档案版本数据

update bd_material_v a
   set a.materialspec =
       (select b.new_materialspec from ggbg b where a.code = b.code)
 where exists (select 1 from ggbg b where a.code = b.code)
