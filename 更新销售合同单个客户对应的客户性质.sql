--更新销售合同单个客户对应的客户性质

/*查询客户性质*/
select code, name, pk_defdoc
  from bd_defdoc
 where pk_defdoclist =
       (select pk_defdoclist from bd_defdoclist where name = '客户性质')
       --13	KHXZ0102	外部客户-国内销售	1001D1100000009P0N8Y
       --1	KHXZ01	外部客户	1001D1100000009IN33A

       
 select code, name, pk_customer
   from bd_customer
  where name = '荆门市屈家岭管理区宏荣发展有限公司'--1001D11000000088QR4L
  
  update ct_sale set vdef4='1001D1100000009IN33A' where pk_customer ='1001D11000000088QR4L'
