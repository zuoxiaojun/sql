select taxcodeid 
  from ar_recitem
 where   pk_recbill  =
       (select   pk_recbill  from ar_recbill where billno = '83600YS18050003' and dr=0)  --    1001D110000000A8KX79
       
 
select pk_taxcode  from bd_taxcode where code ='CN16'
