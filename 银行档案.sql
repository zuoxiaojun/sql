select a.code, a.name, b.name
  from bd_asslinenum a
  left join bd_banktype b
    on a.pk_banktype = b. pk_banktype
 where a.dr = 0
