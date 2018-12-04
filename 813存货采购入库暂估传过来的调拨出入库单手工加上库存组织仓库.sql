/*
813存货采购入库手工加上库存组织仓库
*/

select cstockorgvid, cstockorgid, cstordocid
  from ia_i2bill
 where vbillcode = '81300I22018110001'
 --cstockorgvid  0001B11000000000IIC6 
 --cstockorgid   0001B11000000000IIC7  库存组织
 --cstordocid    1001B11000000002IGHT   原辅料-自采-正常
 select * from dbck;
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
   where vbillcode in (select vbillcode from dbck ) 
   and dr ='0'
