--查询版型主键
select pk_material, code, name
  from bd_material_v
 where pk_marbasclass in
       (select pk_marbasclass
          from bd_marbasclass
         where name in ('成本对象类', '鑫宇成本对象（品种）'))

--创建版型更新表
create table zlbx (
code varchar2(100),
name varchar2(100),
zlpk   varchar2(100),--主联
zlname varchar2(100),
zjpk  varchar2(100),--组件
zjname varchar2(100)
)

select  * from  zlbx 

truncate table zlbx

--更新def2为主联版型

/*update bd_material a
   set a.def2 =
       (select b.zlpk from zlbx b where a.code = b.code)
 where exists (select 1 from zlbx b where a.code = b.code);*/
 
 
/*update bd_material_v a
   set a.def2 =
       (select b.zlpk from zlbx b where a.code = b.code)
 where exists (select 1 from zlbx b where a.code = b.code)*/
 
merge into bd_material a
using zlbx b
on (a.code = b.code)
when matched then
  update set a.def2 = b.zlpk;
  
merge into bd_material_v a
using zlbx b
on (a.code = b.code)
when matched then
  update set a.def2 = b.zlpk

--更新def1为产品组件版型

/*update bd_material a
   set a.def1 =
       (select b.zjpk from zlbx b where a.code = b.code)
 where exists (select 1 from zlbx b where a.code = b.code);*/
 
 /*
update bd_material_v a
   set a.def1 =
       (select b.zjpk from zlbx b where a.code = b.code)
 where exists (select 1 from zlbx b where a.code = b.code)
*/
 
 merge into bd_material a
 using zlbx b
 on (a.code = b.code)
 when matched then
   update set a.def1 = b.zjpk;
 
 merge into bd_material_v a
 using zlbx b
 on (a.code = b.code)
 when matched then
   update set a.def1 = b.zjpk



/*更新物料与物料版本主联版型数据一致*/

--查询出不相同的数据
select code from (
select a.code,a.def1, a.def2, 
b.def1   bdef1, 
b.def2   bdef2
  from bd_material a
  left join bd_material_v b
    on a.code = b.code)
where def2<>bdef2


update bd_material_v a
   set a.def1 =
       (select b.def1 from bd_material b where a.code = b.code)
 where exists
 (select 1 from bd_material b where a.code = b.code)
   and a.code in
       (select code
          from (select a.code, a.def1, a.def2, b.def1 bdef1, b.def2 bdef2
                  from bd_material a
                  left join bd_material_v b
                    on a.code = b.code)
         where def1 <> bdef1)
