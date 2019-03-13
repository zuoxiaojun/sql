/*查询单据引用的银行账户*/
select count(*) from cc_bankprotocol where dr=0

--企业授信协议
select protocolcode, pk_bankprotocol, pk_creditbank
  from cc_bankprotocol
 where pk_creditbank in (select pk_bankdoc from v_bank_notin)

--担保物权

