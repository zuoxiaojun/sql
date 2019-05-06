-- 账户的表 bd_bankaccbas   -- 子  户 表 bd_bankaccsub
select pk_bankaccbas,
       accname,
       accnum,
       dr,
       code,
       name,
       dataoriginflag,
       enablestate
  from bd_bankaccbas
 where accnum = '37090181000127540'  and enablestate='2' for update

select code, name, accnum, accname, fronzenstate, pk_currtype, dr
  from bd_bankaccsub
 where pk_bankaccbas = '1001D110000000DA210I'
   for update

