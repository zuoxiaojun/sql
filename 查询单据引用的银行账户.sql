/*��ѯ�������õ������˻�*/
select count(*) from cc_bankprotocol where dr=0

--��ҵ����Э��
select protocolcode, pk_bankprotocol, pk_creditbank
  from cc_bankprotocol
 where pk_creditbank in (select pk_bankdoc from v_bank_notin)

--������Ȩ

