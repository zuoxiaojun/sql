/*�������Ƽ��ϣ�����棩*/

create table fcwl (
code varchar2(200),
name  varchar2(200),
guige     varchar2(200)
)

select * from fcwl;

--odbc��������

update bd_material
   set name = '������棩' || name
 where code in (select code from fcwl);
 
update bd_material_v
   set name = '������棩' || name
 where code in (select code from fcwl);
