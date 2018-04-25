select substr(dbilldate, 1, 7) "单据月份", (sum(ntaxmny)/1000000000) "销售金额(亿元)"
  from so_saleorder_b
 where so_saleorder_b.dr = 0
 group by substr(dbilldate, 1, 7)
order by "单据月份"
