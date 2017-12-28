 /*更新销售发票表头vdef15字段为对应客户分类主键*/
 
 select distinct (cinvoicecustid )
   from so_saleinvoice
  where dbilldate > '2017-11-01 00:00:00'
    and vdef15 = '~';  --查询客户唯一值
    
  select pk_customer, pk_custclass
    from bd_customer
   where pk_customer in (select distinct (cinvoicecustid)
                           from so_saleinvoice
                          where dbilldate > '2017-11-01 00:00:00'
                            and vdef15 = '~')
   order by pk_custclass
                            
update so_saleinvoice
   set vdef15 = '1001A110000000000OBO'
 where cinvoicecustid in ('1001B1100000000DBKDD',
                          '0001D11000000008UW34'                     
                      )
   and dbilldate > '2017-11-01 00:00:00'
   and vdef15 = '~'

