
/*

813����ڲ����״������ĵ�������ⵥ�ֹ����Ͽ����֯�ֿ�

*/
select cstockorgvid, cstockorgid, cstordocid
  from ia_iibill
 where vbillcode = '81300I22018110941'


--cstockorgvid   0001B11000000000IIC6
--cstockorgid    0001B11000000000IIC7
--cstordocid     1001B11000000002IGM0  �Բ���Ʒ           1001B11000000002IGHT  ԭ����-�Բ�-����
                         
create table dbck (
vbillcode varchar2(255) ,
 ck          varchar2(255)  
 )
 
 select * from dbck;
 truncate table dbck;
 update ia_iibill
    set cstockorgvid = '0001B11000000000IIC6',
        cstockorgid  = '0001B11000000000IIC7',
        cstordocid='1001B11000000002IGM0'
  where vbillcode in (select vbillcode from dbck where ck='�Բ���Ʒ')--������ⵥ
  
  
  update ia_ijbill
     set cstockorgvid = '0001B11000000000IIC6',
         cstockorgid  = '0001B11000000000IIC7',
         cstordocid='1001B11000000002IGM0'
   where vbillcode in (select vbillcode from dbck where ck='�Բ���Ʒ') --�������ⵥ
  
   update ia_iibill
    set cstockorgvid = '0001B11000000000IIC6',
        cstockorgid  = '0001B11000000000IIC7',
        cstordocid='1001B11000000002IGHT'
  where vbillcode in (select vbillcode from dbck where ck='ԭ����-�Բ�-����')--������ⵥ
  
  
  update ia_ijbill
     set cstockorgvid = '0001B11000000000IIC6',
         cstockorgid  = '0001B11000000000IIC7',
         cstordocid='1001B11000000002IGHT'
   where vbillcode in (select vbillcode from dbck where ck='ԭ����-�Բ�-����') --�������ⵥ
  
  
--������ϸʵ��
select * from ia_detailledger where vbillcode in (select vbillcode from dbck)


  update ia_detailledger
     set cstockorgvid = '0001B11000000000IIC6',
         cstockorgid  = '0001B11000000000IIC7',
         cstordocid='1001B11000000002IGHT'
   where vbillcode in (select vbillcode from dbck where ck='ԭ����-�Բ�-����') 
   
   update ia_detailledger
     set cstockorgvid = '0001B11000000000IIC6',
         cstockorgid  = '0001B11000000000IIC7',
         cstordocid='1001B11000000002IGM0'
   where vbillcode in (select vbillcode from dbck where ck='�Բ���Ʒ') --�������ⵥ
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
