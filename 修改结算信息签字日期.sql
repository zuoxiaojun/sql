--�޸Ľ�����Ϣǩ�����ڣ�����״̬

select pk_executor, pk_signer, signdate, settlestatus, settletype,pk_settlement
  from cmp_settlement
 where billcode = '80100FK19040123'  --1001D110000000H1ZUID
   for update

--������Ϣ��ϸ
select settlestatus
  from cmp_detail
 where pk_settlement = '1001D110000000H1ZUID'
   for update


--���
select pk_paybill, effectstatus --��Ч״̬
  from ap_paybill
 where billno = '80100FK19040123'
   for update

