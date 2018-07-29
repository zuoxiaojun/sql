select * from bd_income where  

select pk_incomeperiod, name from bd_incomeperiod  
--5	1001Z01000000000E4K1	销售订单日期
--6	1001Z01000000000E4K2	销售合同生效日期


select  *  from bd_incomech where pk_incomeperiod ='1001Z01000000000E4K2'

--将收款协议表体起效时点合同生效日期批量更新成销售订单订单
update bd_incomech
   set pk_incomeperiod = '1001Z01000000000E4K1'
 where pk_incomeperiod = '1001Z01000000000E4K2'
