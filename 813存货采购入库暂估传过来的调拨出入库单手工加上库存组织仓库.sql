/*
813����ɹ�����ֹ����Ͽ����֯�ֿ�
*/

select cstockorgvid, cstockorgid, cstordocid
  from ia_i2bill
 where vbillcode = '81300I22018110001'
 --cstockorgvid  0001B11000000000IIC6 
 --cstockorgid   0001B11000000000IIC7  �����֯
 --cstordocid    1001B11000000002IGHT   ԭ����-�Բ�-����
 --                     1001B11000000002IGM0  �Բ���Ʒ
 
 select * from dbck  ;
truncate table dbck
--�ɹ���ⵥ

update ia_i2bill 
set cstockorgvid='0001B11000000000IIC6',
cstockorgid='0001B11000000000IIC7',
cstordocid='1001B11000000002IGHT'
where vbillcode in (select vbillcode from dbck );

--������ϸʵ��

  update ia_detailledger
     set cstockorgvid = '0001B11000000000IIC6',
         cstockorgid  = '0001B11000000000IIC7',
         cstordocid='1001B11000000002IGHT'
   where vbillcode in (select vbillcode from dbck where ck='ԭ����-�Բ�-����') 
   and dr ='0'


--������ⵥ

select cstockorgvid, cstockorgid, cstordocid
  from ia_iibill
 where vbillcode = '81300II2018121434';
 
update ia_iibill set cstockorgvid = '0001B11000000000IIC6',
         cstockorgid  = '0001B11000000000IIC7',
         cstordocid ='1001B11000000002IGM0'
         where vbillcode in (select vbillcode from dbck where ck='�Բ���Ʒ')
         and dr='0'
  
    update ia_detailledger
     set cstockorgvid = '0001B11000000000IIC6',
         cstockorgid  = '0001B11000000000IIC7',
         cstordocid='1001B11000000002IGM0'
   where vbillcode in (select vbillcode from dbck where ck='�Բ���Ʒ') 
   and dr ='0'

--�������ⵥ

update ia_ijbill set cstockorgvid = '0001B11000000000IIC6',
         cstockorgid  = '0001B11000000000IIC7',
         cstordocid ='1001B11000000002IGHT'
         where vbillcode in (select vbillcode from dbck where ck='ԭ����-�Բ�-����')
         and dr='0'

   update ia_detailledger
     set cstockorgvid = '0001B11000000000IIC6',
         cstockorgid  = '0001B11000000000IIC7',
         cstordocid='1001B11000000002IGHT'
   where vbillcode in (select vbillcode from dbck where ck='ԭ����-�Բ�-����') 
   and dr ='0'










