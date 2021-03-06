select kh.code,
       kh.name,
       kh.tel3,
       kh.fax1,
       --          yh.accname,
       --          yh.accnum,
       bank.name || accno.accnum as YHZH,
       accno.accnum,
       accno.code,
       bank.name,
       ksyh.*,
       accno.*
  from bd_customer kh
  left join bd_custbank ksyh
    on ksyh.pk_cust = kh.pk_customer
   and kh.dr = 0
   and ksyh.dr = 0
   and ksyh.accclass = 1
  left join bd_bankaccbas accno
    on accno.pk_bankaccbas = ksyh.pk_bankaccbas
   and accno.dr = 0
  left join bd_bankdoc bank
    on bank.pk_bankdoc = accno.pk_bankdoc
   and bank.dr = 0
 where 1 = 1    
   and accno.accnum is null
   and length(kh.fax1) > 10
