--�޸� �����嵥�����ҵ���
--�����嵥�ӱ�
select nprice,ntaxprice
  from to_settlelist_b
 where cbillid =
       (select cbillid from to_settlelist where vbillcode = '5F20180623089') for update 

--�����嵥���ӱ�
select 
       nexchangerate,                        --����
       ccurrencyid,
       nprice,--��������˰����
       ninprice,  --���뷽��������˰����                               
     nqttaxprice --���Һ�˰���� 
  from to_settlelist_bb
 where cbillid = (select cbillid from to_settlelist where vbillcode = '5F20180623089' and dr =0) for update 
 
