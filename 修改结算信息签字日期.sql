--修改结算信息签字日期，单据状态

select pk_executor, pk_signer, signdate, settlestatus, settletype,pk_settlement
  from cmp_settlement
 where billcode = '80100FK19040123'  --1001D110000000H1ZUID
   for update

--结算信息明细
select settlestatus
  from cmp_detail
 where pk_settlement = '1001D110000000H1ZUID'
   for update


--付款单
select pk_paybill, effectstatus --生效状态
  from ap_paybill
 where billno = '80100FK19040123'
   for update

