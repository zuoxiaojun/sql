select local_money_de, money_de,notax_de 
  from ar_recitem
 where pk_recbill =
       (select pk_recbill from ar_recbill where billno = '81300YS18110092')
   for update


--Ӧ������
select local_tax_cr, --˰��
local_notax_cr, --��֯������˰��� 
notax_cr, --����ԭ����˰��� 
local_money_cr, --��֯���ҽ��
money_cr,  --����ԭ�ҽ��
money_bal ,--ԭ�����
local_money_bal --��֯�������
  from ap_payableitem
 where pk_payablebill = (select pk_payablebill
                           from ap_payablebill
                          where billno = '80100YF18110213'
                            and dr = '0')
   for update
     
--Ӧ����
select money, local_money
  from ap_payablebill
 where billno = '80100YF18110213'
   and dr = '0'
for update 



