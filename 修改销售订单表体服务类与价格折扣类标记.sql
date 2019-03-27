
--修改销售订单表体服务类与价格折扣类标记

select crowno  ,bdiscountflag, blaborflag
  from so_saleorder_b
 where csaleorderid =
       (select csaleorderid
          from so_saleorder
         where vbillcode = '82500XD20190307001')
   and cmaterialid = '1001D110000000DNP1F4'
   for update 


