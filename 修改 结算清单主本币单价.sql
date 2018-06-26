--修改 结算清单主本币单价
--结算清单子表
select nprice,ntaxprice
  from to_settlelist_b
 where cbillid =
       (select cbillid from to_settlelist where vbillcode = '5F20180623089') for update 

--结算清单子子表
select 
       nexchangerate,                        --汇率
       ccurrencyid,
       nprice,--主本币无税单价
       ninprice,  --调入方主本币无税单价                               
     nqttaxprice --本币含税单价 
  from to_settlelist_bb
 where cbillid = (select cbillid from to_settlelist where vbillcode = '5F20180623089' and dr =0) for update 
 
