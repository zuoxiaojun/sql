

--�������������Զ�����6Ϊ����

select * from bd_material

--���������м��
create table wlhh (
code varchar2(255),
hh   varchar2(255)
);

select * from wlhh;

--��������
merge into bd_material a
using wlhh b
on (a.code = b.code)
when matched then
  update set a.def6 = b.hh

--�������ϰ汾
merge into bd_material_v a
using wlhh b
on (a.code = b.code)
when matched then
  update set a.def6 = b.hh
