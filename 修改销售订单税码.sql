
--修改销售订单税码
select ctaxcodeid 
  from so_saleorder_b
 where csaleorderid = (select csaleorderid
                         from so_saleorder
                        where vbillcode = '82600XD20190102002'
                          and dr = 0
                          and iversion = '11')
      
   and dr = 0 for update 


select   pk_taxcode ,code,description  from bd_taxcode where code ='CN10'  --1001D110000000112IHU
