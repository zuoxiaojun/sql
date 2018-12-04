
/*

813存货内部交易传过来的调拨出入库单手工加上库存组织仓库

*/
select cstockorgvid, cstockorgid, cstordocid
  from ia_iibill
 where vbillcode = '81300I22018110941'


--cstockorgvid   0001B11000000000IIC6
--cstockorgid    0001B11000000000IIC7
--cstordocid     1001B11000000002IGM0  自产成品           1001B11000000002IGHT  原辅料-自采-正常
                         
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
  where vbillcode in (select vbillcode from dbck where ck='自产成品')--调拨入库单
  
  
  update ia_ijbill
     set cstockorgvid = '0001B11000000000IIC6',
         cstockorgid  = '0001B11000000000IIC7',
         cstordocid='1001B11000000002IGM0'
   where vbillcode in (select vbillcode from dbck where ck='自产成品') --调拨出库单
  
   update ia_iibill
    set cstockorgvid = '0001B11000000000IIC6',
        cstockorgid  = '0001B11000000000IIC7',
        cstordocid='1001B11000000002IGHT'
  where vbillcode in (select vbillcode from dbck where ck='原辅料-自采-正常')--调拨入库单
  
  
  update ia_ijbill
     set cstockorgvid = '0001B11000000000IIC6',
         cstockorgid  = '0001B11000000000IIC7',
         cstordocid='1001B11000000002IGHT'
   where vbillcode in (select vbillcode from dbck where ck='原辅料-自采-正常') --调拨出库单
  
  
--单据明细实体
select * from ia_detailledger where vbillcode in (select vbillcode from dbck)


  update ia_detailledger
     set cstockorgvid = '0001B11000000000IIC6',
         cstockorgid  = '0001B11000000000IIC7',
         cstordocid='1001B11000000002IGHT'
   where vbillcode in (select vbillcode from dbck where ck='原辅料-自采-正常') 
   
   update ia_detailledger
     set cstockorgvid = '0001B11000000000IIC6',
         cstockorgid  = '0001B11000000000IIC7',
         cstordocid='1001B11000000002IGM0'
   where vbillcode in (select vbillcode from dbck where ck='自产成品') --调拨出库单
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
