--��ѯ��������
select pk_material, code, name
  from bd_material_v
 where pk_marbasclass in
       (select pk_marbasclass from bd_marbasclass where name = '�ɱ�������')

--�������͸��±�
create table zlbx (
code varchar2(100),
name varchar2(100),
zlpk   varchar2(100),--����
zlname varchar2(100),
zjpk  varchar2(100),--���
zjname varchar2(100)
)

select  * from  zlbx 
--truncate table zlbx

--����def2Ϊ��������
update bd_material a
   set a.def2 =
       (select b.zlpk from zlbx b where a.code = b.code)
 where exists (select 1 from zlbx b where a.code = b.code);

update bd_material_v a
   set a.def2 =
       (select b.zlpk from zlbx b where a.code = b.code)
 where exists (select 1 from zlbx b where a.code = b.code)

--����def1Ϊ��Ʒ�������

update bd_material a
   set a.def1 =
       (select b.zjpk from zlbx b where a.code = b.code)
 where exists (select 1 from zlbx b where a.code = b.code);

update bd_material_v a
   set a.def1 =
       (select b.zjpk from zlbx b where a.code = b.code)
 where exists (select 1 from zlbx b where a.code = b.code)













