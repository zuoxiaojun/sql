select * from fcwl
--²éÑ¯ÎïÁÏ´ý·â´æ
select  code,name  from bd_material where code ='0105070149'
select  code,name  from bd_material_v where code ='0105070149' 

select code, name
  from bd_material_v
 where code in (select code from bd_material where name like '%´ý·â´æ%')
   

update bd_material_v
   set name =
       replace (name, '£¨´ý·â´æ£©', '')
 where code in
       (select code
          from bd_material_v
         where code in
               (select code from bd_material where name like '%´ý·â´æ%')
           and name like '£¨´ý·â´æ£©%')
           
update bd_material_v
   set name = '£¨´ý·â´æ£©' || name
 where code in (select code from bd_material where name like '%´ý·â´æ%')


select * from fcwl
