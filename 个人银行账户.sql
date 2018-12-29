
--个人银行账户   
select accnum, accname, creationtime, creator, modifier, modifiedtime
  from bd_bankaccbas
 where modifiedtime = '2018-12-24 09:37:53'
  for update 

--银行账户子户
select pk_bankaccbas  from bd_bankaccbas where accnum ='01291620012445'--1001D110000000E6PDRV
select * from bd_bankaccsub  where pk_bankaccbas='1001D110000000E6PDRV' for update 

delete from bd_bankaccsub where pk_bankaccbas='1001D110000000E6PDRV' and PK_CURRTYPE='1002Z0100000000001K8'
