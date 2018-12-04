/*
813存货调拨出入库单手工加上库存组织仓库
*/

select cstockorgvid, cstockorgid, cstordocid
  from ia_ijbill
 where vbillcode = '81300I22018110001'
 --cstockorgvid  0001B11000000000IIC6 
 --cstockorgid   0001B11000000000IIC7  库存组织
 --cstordocid    1001B11000000002IGHT   原辅料-自采-正常
 select * from dbck;
truncate table dbck


--调拨出库单
update ia_ijbill 
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
