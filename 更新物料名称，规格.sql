--�������±�wl


select * from wl

truncate table wl
--odbc��������
--����ԭ��
create table bd_material_bak0902 as select * from bd_material


--��ԭ���ƹ��д�뱸ע�ֶ�

update bd_material
   set memo ='ԭ���ƹ��:'||name||materialspec
 where code in (select code from wl)

update bd_material
   set memo ='ԭ���ƹ��:'||name||materialspec
 where code in (select code from wl)
 
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

/*���ϱ���ǰ���ϣ�����棩*/
--����������ݱ�fcwl

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






