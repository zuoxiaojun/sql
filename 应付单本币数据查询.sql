
--Ӧ�����������ݲ�ѯ
select grouprate,
       globalrate,
       rate,
       groupcrebit     "���ű��ҽ��(����)" ,
       globalcrebit "ȫ�ֱ��ҽ��(����)",
       groupnotax_cre  "���ű�����˰���(����)",
       globalnotax_cre "ȫ�ֱ�����˰���(����)",
       local_money_cr  "��֯���ҽ��",  
       local_notax_cr  "��֯������˰���",
       pk_currtype     "����",
       money_cr "����ԭ�ҽ��"   
  from ap_payableitem
 where pk_payablebill = (select pk_payablebill
                           from ap_payablebill
                          where billno = '82500YF18050020'
                            and dr = 0)
   for update


select local_money,grouplocal,globallocal,pk_currtype 
  from ap_payablebill
 where billno = '81800YF18050017'
   and dr = 0  for update 
