
/*总账执行对账，业务数据是从以下三张表取值*/
select * from arap_tally where billno  = '80100YF18110013'  for update
  
select  * from arap_busidata where pk_item = '1001D110000000DCMKFB' for update
  
select * from arap_termitem where pk_item = '1001D110000000DCMKFB' for update


