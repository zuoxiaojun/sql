/*批量修改2018-07之前的销售合同上客户的客户性质字段*/


create table khxz (
khpk varchar2(20),
xzpk varchar2(20)
)
tablespace nnc_data01

select * from khxz

select pk_customer, vdef4,vbillcode
  from ct_sale
 where vdef4 = '~'
   and dr = 0

update ct_sale a
   set a.vdef4 =
       (select b.xzpk from khxz b where a.pk_customer = b.khpk)
 where exists (select * from khxz b where a.pk_customer = b.khpk)
   and vdef4 = '~'

