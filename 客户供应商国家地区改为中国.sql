select code, name
  from bd_supplier
 where pk_country <> '0001Z010000000079UJJ'; --供应商国家地区非中国
select code, name
  from bd_customer
 where pk_country <> '0001Z010000000079UJJ' --客户国家地区非中国


select pk_country ,name  from bd_countryzone  where name='中国';

update bd_supplier
   set pk_country = '0001Z010000000079UJJ'
 where pk_country <> '0001Z010000000079UJJ';

update bd_customer
   set pk_country = '0001Z010000000079UJJ'
 where pk_country <> '0001Z010000000079UJJ'
