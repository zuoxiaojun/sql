select substr(dbilldate, 1, 7) "�����·�", (sum(ntaxmny)/1000000000) "���۽��(��Ԫ)"
  from so_saleorder_b
 where so_saleorder_b.dr = 0
 group by substr(dbilldate, 1, 7)
order by "�����·�"
