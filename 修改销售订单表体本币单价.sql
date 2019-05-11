--修改销售订单表体本币单价
select nqttaxprice,
       nqtprice,
       nqttaxnetprice,
       nqtnetprice,
       ntaxprice,
       nprice,
       ntaxnetprice,
       nnetprice,
       nmny
  from so_saleorder_b
 where csaleorderid in
       (select csaleorderid
          from so_saleorder
         where vbillcode = '82500XD20190301003') for update 
