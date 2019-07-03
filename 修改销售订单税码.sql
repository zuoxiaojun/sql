
--修改销售订单税码
select ctaxcodeid
  from so_saleorder_b
 where csaleorderid = (select csaleorderid
                         from so_saleorder
                        where vbillcode = '82600XD20190702007'
                          and dr = 0)
      
   and dr = 0
   for update --1001Z01000000003W0X1


select pk_taxcode, code, description
  from bd_taxcode
 where code = 'CN10' --1001D110000000112IHU
