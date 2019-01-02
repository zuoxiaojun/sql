select def4, def5, def6, def7,code,name
  from bd_customer
 where pk_customerpf =
       (select pk_customerpf
          from bd_customer_pf
         where billnumber = 'CUS20181219033')



