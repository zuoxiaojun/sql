/*集成更新物料名称与规格*/

--创建数据更新表
create table wl (
code varchar2(200),
name  varchar2(200),
guige     varchar2(200)
)
 tablespace nnc_data01;
 
 --ODBC数据导入
 select * from wl
 truncate table wl
 
  create table bd_material_20181011 as select * from bd_material; --备份
 
 --将原名称，规格追加到备注字段
 update bd_material
    set memo  = '原名称规格：' ||name || materialspec 
  where code in (select code from wl)
 
update bd_material_v
    set memo  = '原名称规格：' ||name || materialspec 
  where code in (select code from wl)
 
 
 --数据更新
 update bd_material a
   set a.name =
       (select  b.name  from wl b where  a.code =b.code)
 where  exists (select 1 from wl b where  a.code = b.code);

 update bd_material_v a
   set a.name =
       (select  b.name  from wl b where  a.code =b.code)
 where  exists (select 1 from wl b where  a.code = b.code)--更新物料名称



 update bd_material a
   set a.materialspec =
       (select  b. guige  from wl b where  a.code = b.code)
 where  exists (select 1 from wl b where  a.code = b.code);
 
  update bd_material_v a
   set a.materialspec =
       (select  b. guige  from wl b where  a.code = b.code)
 where  exists (select 1 from wl b where  a.code = b.code);--更新物料规格
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
