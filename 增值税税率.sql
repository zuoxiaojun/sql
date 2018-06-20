select taxrate
  from bd_taxrate
 where pk_taxcode = (select pk_taxcode from bd_taxcode where code = 'CN01')



