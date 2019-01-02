/*
813存货采购入库手工加上库存组织仓库
*/

select cstockorgvid, cstockorgid, cstordocid
  from ia_i2bill
 where vbillcode = '81300I22018110001'
 --cstockorgvid  0001B11000000000IIC6 
 --cstockorgid   0001B11000000000IIC7  库存组织
 --cstordocid    1001B11000000002IGHT   原辅料-自采-正常
 --                     1001B11000000002IGM0  自产成品
 
 select * from dbck  ;
truncate table dbck
--采购入库单

update ia_i2bill 
set cstockorgvid='0001B11000000000IIC6',
cstockorgid='0001B11000000000IIC7',
cstordocid='1001B11000000002IGHT'
where vbillcode in (select vbillcode from dbck );

--单据明细实体

  update ia_detailledger
     set cstockorgvid = '0001B11000000000IIC6',
         cstockorgid  = '0001B11000000000IIC7',
         cstordocid='1001B11000000002IGHT'
   where vbillcode in (select vbillcode from dbck where ck='原辅料-自采-正常') 
   and dr ='0'


--调拨入库单

select cstockorgvid, cstockorgid, cstordocid
  from ia_iibill
 where vbillcode = '81300II2018121434';
 
update ia_iibill set cstockorgvid = '0001B11000000000IIC6',
         cstockorgid  = '0001B11000000000IIC7',
         cstordocid ='1001B11000000002IGM0'
         where vbillcode in (select vbillcode from dbck where ck='自产成品')
         and dr='0'
  
    update ia_detailledger
     set cstockorgvid = '0001B11000000000IIC6',
         cstockorgid  = '0001B11000000000IIC7',
         cstordocid='1001B11000000002IGM0'
   where vbillcode in (select vbillcode from dbck where ck='自产成品') 
   and dr ='0'

--调拨出库单

update ia_ijbill set cstockorgvid = '0001B11000000000IIC6',
         cstockorgid  = '0001B11000000000IIC7',
         cstordocid ='1001B11000000002IGHT'
         where vbillcode in (select vbillcode from dbck where ck='原辅料-自采-正常')
         and dr='0'

   update ia_detailledger
     set cstockorgvid = '0001B11000000000IIC6',
         cstockorgid  = '0001B11000000000IIC7',
         cstordocid='1001B11000000002IGHT'
   where vbillcode in (select vbillcode from dbck where ck='原辅料-自采-正常') 
   and dr ='0'










