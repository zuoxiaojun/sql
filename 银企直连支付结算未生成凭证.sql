
--银企直连支付结算未生成凭证
--将结算状态手工改成  1（支付中） 
--支付指令状态重新同步下即可
select settlestatus
  from cmp_settlement
 where billcode = '81300CL18120055'
   for update;

update cmp_settlement
   set settlestatus = '1'
 where billcode in ( select billcode from bxd
 )
   and dr = '0'


create table bxd (
billcode varchar(30)
)


select * from bxd
