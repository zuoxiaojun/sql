select * from fcwl
--��ѯ���ϴ����
select  code,name  from bd_material where code ='0105070149'
select  code,name  from bd_material_v where code ='0105070149' 

select code, name
  from bd_material_v
 where code in (select code from bd_material where name like '%�����%')
   

update bd_material_v
   set name =
       replace (name, '������棩', '')
 where code in
       (select code
          from bd_material_v
         where code in
               (select code from bd_material where name like '%�����%')
           and name like '������棩%')
           
update bd_material_v
   set name = '������棩' || name
 where code in (select code from bd_material where name like '%�����%')


select * from fcwl
