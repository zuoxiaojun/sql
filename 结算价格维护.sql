--�ڲ������嵥������۸�ά������
--���������ν��������֯�ͳɱ���
select cbillid,corigcurrencyid from to_settlelist where vbillcode = '5F20180510013' for update; --1001D110000000ADKCH9
select crowno,
       cupcostregionid,
       cupfinanceorgid,
       cupfinanceorgvid,
       cdowncostregionid,
       cdownfinanceorgid,
       cdownfinanceorgvid,
       norigtaxprice,
       nexchangerate,                        --����
       ccurrencyid                              --1002Z0100000000001K8 ��Ԫ
  from to_settlelist_bb
 where cbillid = '1001D110000000ADKCH9'
 order by CCURRENCYID  for update




