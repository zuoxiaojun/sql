/*���ɸ���������������*/

--�������ݸ��±�
create table wl (
code varchar2(200),
name  varchar2(200),
guige     varchar2(200)
)
 tablespace nnc_data01;
 
 --ODBC���ݵ���
 select * from wl
 
 --��ԭ���ƣ�����Ҹ��Զ����ֶδ�����
 update bd_material
    set def19 = name, def20 = materialspec
  where code in (select code from wl)
 
 --���ݸ���
 update bd_material a
   set a.name =
       (select  b.name  from wl b where  a.code =b.code)
 where  exists (select 1 from wl b where  a.code = b.code);

 update bd_material_v a
   set a.name =
       (select  b.name  from wl b where  a.code =b.code)
 where  exists (select 1 from wl b where  a.code = b.code)--������������



 update bd_material a
   set a.materialspec =
       (select  b. guige  from wl b where  a.code = b.code)
 where  exists (select 1 from wl b where  a.code = b.code);
 
  update bd_material_v a
   set a.materialspec =
       (select  b. guige  from wl b where  a.code = b.code)
 where  exists (select 1 from wl b where  a.code = b.code);--�������Ϲ��
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
