--�ڲ������嵥������۸�ά������
--���������ν��������֯�ͳɱ���
select cbillid, corigcurrencyid
  from to_settlelist
 where vbillcode = '812005F20190501001'
   for update; --1001D110000000FR5PJC

select crowno,
       cupcostregionid, --���γɱ���
       cupfinanceorgid, --���β�����֯���°汾
       cupfinanceorgvid, --���β�����֯
       cdowncostregionid, --���γɱ���
       cdownfinanceorgid, --���β�����֯���°汾
       cdownfinanceorgvid, --���β�����֯ 
       norigtaxprice, --������ֺ�˰���� 
       nexchangerate, --����
       ninexchangerate, --���뷽�۱����� 
       ccurrencyid, --�������
       nprice, --��������˰����
       ninprice --���뷽��������˰����                           --1002Z0100000000001K8 ��Ԫ    --1002Z0100000000001K1  �����
  from to_settlelist_bb                                          --1002Z0100000000001K3  ŷԪ
 where cbillid = '1001D110000000H30GGR'
      --order by CCURRENCYID  for update
   and cupfinanceorgvid =
       (select pk_vid from org_financeorg_v where code = '812') --���β�����֯
  for update 




