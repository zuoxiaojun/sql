

--批量更新物料自定义项6为货号

select * from bd_material

--创建更新中间表
create table wlhh (
code varchar2(255),
hh   varchar2(255)
);

select * from wlhh;

--更新物料
merge into bd_material a
using wlhh b
on (a.code = b.code)
when matched then
  update set a.def6 = b.hh

--更新物料版本
merge into bd_material_v a
using wlhh b
on (a.code = b.code)
when matched then
  update set a.def6 = b.hh
