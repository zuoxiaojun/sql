--销售订单物料主键检查

select vbillcode
  from so_saleorder
 where csaleorderid in (select csaleorderid
                          from so_saleorder_b
                         where cmaterialvid <> cmaterialid)
                         
update so_saleorder_b
   set cmaterialid = cmaterialvid
 where cmaterialvid <> cmaterialid
