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
 where accnum = '3050020010120100247366'  and enablestate='2' for update

select code, name, accnum, accname,fronzenstate 
  from bd_bankaccsub
 where  pk_bankaccsub  = '1001D1100000000FBEHN'
   for update
