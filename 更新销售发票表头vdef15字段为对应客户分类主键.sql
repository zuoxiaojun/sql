 /*�������۷�Ʊ��ͷvdef15�ֶ�Ϊ��Ӧ�ͻ���������*/
 
 select distinct (cinvoicecustid )
   from so_saleinvoice
  where dbilldate > '2017-11-01 00:00:00'
    and vdef15 = '~';  --��ѯ�ͻ�Ψһֵ
    
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

