select cemployeeid
  from so_saleorder
 where vbillcode = 'SO30AK180710011'
   for update

select pk_psndoc, name
  from bd_psndoc
 where name in ('ÄÂÀòÄÈ', 'ÀèÎ°Íò', 'Ñî¾ü', '³ÂÕñÁÁ')
