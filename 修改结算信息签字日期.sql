--修改结算信息签字日期
select pk_executor, pk_signer, signdate
  from cmp_settlement
 where billcode = '81500FK19030063'
   for update
