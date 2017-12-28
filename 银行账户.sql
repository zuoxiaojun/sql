select pk_bankaccbas,accname,name
  from bd_bankaccbas
 where accnum = '517066545304' -- 账户的表 bd_bankaccbas   -- 子  户 表 bd_bankaccsub

select *
  from bd_bankaccsub
 where pk_bankaccbas = '1001B110000000031844'
   for update
