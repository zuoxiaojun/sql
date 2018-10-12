--查询版型主键
select pk_material, code, name
  from bd_material_v
 where pk_marbasclass in
       (select pk_marbasclass from bd_marbasclass where name = '成本对象类')

--创建主联产品更新表
create table zlbx (
code varchar2(100),
name varchar2(100),
zlpk   varchar2(100)
)

select  * from  zlbx

--更新def2为主联版型
update bd_material a
   set a.def2 =
       (select b.zlpk from zlbx b where a.code = b.code)
 where exists (select 1 from zlbx b where a.code = b.code);

update bd_material_v a
   set a.def2 =
       (select b.zlpk from zlbx b where a.code = b.code)
 where exists (select 1 from zlbx b where a.code = b.code)

















