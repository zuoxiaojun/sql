/*
813�����������ⵥ�ֹ����Ͽ����֯�ֿ�
*/

select cstockorgvid, cstockorgid, cstordocid
  from ia_ijbill
 where vbillcode = '81300I22018110001'
 --cstockorgvid  0001B11000000000IIC6 
 --cstockorgid   0001B11000000000IIC7  �����֯
 --cstordocid    1001B11000000002IGHT   ԭ����-�Բ�-����
 select * from dbck;
truncate table dbck


--�������ⵥ
update ia_ijbill 
set cstockorgvid='0001B11000000000IIC6',
cstockorgid='0001B11000000000IIC7',
cstordocid='1001B11000000002IGHT'
where vbillcode in (select vbillcode from dbck );

--������ϸʵ��

  update ia_detailledger
     set cstockorgvid = '0001B11000000000IIC6',
         cstockorgid  = '0001B11000000000IIC7',
         cstordocid='1001B11000000002IGHT'
   where vbillcode in (select vbillcode from dbck ) 
   and dr ='0'
