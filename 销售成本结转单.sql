--���۳ɱ���ת��
--1=�Ƿ�����Ʒ��0=������Ʒ�跽��1=������Ʒ������
select a.vbillcode,
       c.name,
       decode(a.fintransitflag, 0, '������Ʒ�跽') ������Ʒ,
       a.caccountperiod,
       d.code,
       d.name,
       b.nprice,
       b.nnum,
       b.nmny,
       b.ngroupmny,
       b.nglobalmny
  from ia_i5bill a
  left join ia_i5bill_b b
    on a.cbillid = b.cbillid
  left join bd_customer c
    on a.ccustomerid = c.pk_customer
  left join bd_material d
    on b.cinventoryid = d.pk_material
 where a.dr = 0
   and b.dr = 0
   and b.nmny <> b.ngroupmny

--and a.vbillcode = '80100I52018050905'
