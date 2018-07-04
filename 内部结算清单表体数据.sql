--内部结算清单表体数据
select cinventoryid "物料",
       nqtorigtaxprice "含税单价",
       round(nqtorigprice, 4) "无税单价",
       ntaxprice "主本币含税单价",
       round(nprice, 4) "主本币无税单价",
       norigtaxmny "价税合计",
       ntaxmny "本币价税合计"
  from to_settlelist_b
 where cbillid =
       (select cbillid from to_settlelist where vbillcode = '5F20180629131')
