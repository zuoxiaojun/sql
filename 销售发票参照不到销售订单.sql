/*
销售发票参照不到销售订单
业务流字段错误  CBIZTYPEID

*/

select CBIZTYPEID, --业务流程
csaleorderid
  from so_saleorder
 where vbillcode in ('80501XD20190430001', '80501XD20190425001')
for update 
  
select *
  from so_saleorder_b
 where csaleorderid in ('1001D110000000GZRI75', '1001D110000000H2TQ1W')

--业务流
select businame, busicode, pk_busitype
  from bd_busitype
 where pk_busitype = '1001D11000000010KYGT'
