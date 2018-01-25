select substr(dbilldate, 1, 10) 日期, sum(ntaxmny) 销售金额
  from so_saleorder_b
 where substr(dbilldate, 1, 10) between '2017-12-01' and '2017-12-31'
   and dr = 0
 group by substr(dbilldate, 1, 10)
 order by 日期
