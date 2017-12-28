select djlxbm 
  from er_bxzb
 where operator  =
       (select cuserid from sm_user where user_name = 'Carlos Arguedas')
   and substr(creationtime,1,10) = '2016-10-08';
   
select --pk_billtypeid, pk_billtypecode, billtypename,dr,islock ,isroot 
*
  from bd_billtype
 where pk_billtypecode = '264X-Cxx-001';  --pk_group  0001A110000000000MFL
 
 
