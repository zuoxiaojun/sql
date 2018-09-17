select accnum, accname, code, name, combinenum, combineaccnum, controlorg
  from bd_bankaccbas
 where accclass in ('1', '3')
--查询客商银行账户2个以上的数据
  select accname, accclass, count(name)
    from bd_bankaccbas
   where accclass in ('1', '3')
     and dr = 0 having count(name) >= 2
   group by accname, accclass
