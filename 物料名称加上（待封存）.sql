/*物料名称加上（待封存）*/

create table fcwl (
code varchar2(200),
name  varchar2(200),
guige     varchar2(200)
)

select * from fcwl;

--odbc导入数据

update bd_material
   set name = '（待封存）' || name
 where code in (select code from fcwl);
 
update bd_material_v
   set name = '（待封存）' || name
 where code in (select code from fcwl);
