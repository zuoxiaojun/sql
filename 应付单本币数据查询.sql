
--Ӧ�����������ݲ�ѯ
select grouprate,
       globalrate,
       rate,
       groupcrebit    ,-- "���ű��ҽ��(����)" ,
       globalcrebit ,--"ȫ�ֱ��ҽ��(����)",
       groupnotax_cre,--  "���ű�����˰���(����)",
       globalnotax_cre,-- "ȫ�ֱ�����˰���(����)",
       local_money_cr,--  "��֯���ҽ��",  
       local_notax_cr ,-- "��֯������˰���",
       pk_currtype ,--    "����",
       money_cr --"����ԭ�ҽ��"   
  from ap_payableitem
 where pk_payablebill = (select pk_payablebill
                           from ap_payablebill
                          where billno = '80100YF18110213'
                            and dr = 0)
   for update


select *
  from ap_payablebill
 where billno = '80100YF18110214'
   and dr = 0  for update 
