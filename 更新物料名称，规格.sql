--�������±�wl


select * from wl

--truncate table wl
--odbc��������
--����ԭ��
create table bd_material_bak0904 as select * from bd_material

select code,name,memo from bd_material_bak0904 where memo like '%PDM%'


--��ԭ���ƹ��д�뱸ע�ֶ�
update bd_material
   set memo = 'ԭ���ƹ��:' || name || materialspec
 where code in (select code from wl)

 update bd_material_v set
 memo = 'ԭ���ƹ��:' || name || materialspec
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
 
 
 





