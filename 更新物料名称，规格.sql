select * from wl

--������������
update bd_material a
   set a.name =
       (select b.name from wl b where a.code = b.code)
 where exists (select 1 from wl b where a.code = b.code);

update bd_material_v a
   set a.name =
       (select b.name from wl b where a.code = b.code)
 where exists (select 1 from wl b where a.code = b.code);

--�������Ϲ��
update bd_material a
   set a.materialspec =
       (select b.guige from wl b where a.code = b.code)
 where exists (select 1 from wl b where a.code = b.code);

update bd_material_v a
   set a.materialspec =
       (select b.guige from wl b where a.code = b.code)
 where exists (select 1 from wl b where a.code = b.code);

--���ϱ���ǰ���ϣ�����棩
update bd_material
   set name = '������棩' || name 
 where code in
       (select code
          from fcwl
        minus (select code from bd_material where name like '������棩%'))--�ų�ԭ�д�����ǵ�


update bd_material_v
   set name = '������棩' || name
 where code in
       (select code
          from fcwl
        minus (select code from bd_material where name like '������棩%'))






