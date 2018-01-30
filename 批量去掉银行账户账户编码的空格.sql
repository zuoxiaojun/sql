


--批量去掉银行账户账户编码的空格
select code
  from bd_bankaccsub
 where pk_bankaccbas = '1001D1100000008MAEPM'; --子户 --1001D1100000008MAEPM

select replace(code,' ','') from bd_bankaccbas where accnum = '525801040040972'

create table bd_bankaccbas_nonull as select replace(code,' ','') code_nonull,  pk_bankaccbas from bd_bankaccbas;

select * from bd_bankaccbas_nonull;  

update bd_bankaccbas set code=replace(code,' ','');--银行账户
update bd_bankaccsub set code=replace(code,' ','');--子户



