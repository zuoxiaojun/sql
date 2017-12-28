/*  更新销售出库单表头vdef15为对应客户分类*/
   
 select distinct (ccustomerid)
   from ic_saleout_h
  where dbilldate > '2017-11-01 00:00:00'
    and vdef15 = '~';  --查询客户唯一值

select pk_customer, pk_custclass
  from bd_customer
 where pk_customer in (select distinct (ccustomerid)
                         from ic_saleout_h
                        where dbilldate > '2017-11-01 00:00:00'
                          and vdef15 = '~')
 order by pk_custclass;   --取出客户分类主键
 
update ic_saleout_h
   set vdef15 = '1001D11000000078RE3H'
 where ccustomerid in ('1001B11000000001ZG0B',
                       '1001B1100000000EXBEQ',
                       '1001D1100000000MJLN5',
                       '1001D1100000000YTL50',
                       '1001D11000000051S51F',
                       '1001D11000000017Q6DR',
                       '1001D1100000000WRLT4',
                       '1001D1100000006CO97T',
                       '1001D1100000006CO98R',
                       '1001D11000000071H4Y4',
                       '1001D1100000001M37CJ',
                       '1001D110000000691B31',
                       '1001D11000000072VDV1'
                       
                       )
   and dbilldate > '2017-11-01 00:00:00'
   and vdef15 = '~'  --更新数据
