select * from cmp_paybill where bill_no ='82500FK18110030'

select * from ap_paybill where billno ='82500FK18110030'

--������㱨��  �ۼ��޸Ľ��[9771.64]����������[0.00��4885.82]��Χ

select actualpaymny--���ۼƽ��������
  from cmp_apply_b
 where pk_apply in
       (select pk_apply
          from cmp_apply
         where vbillno in
               ('SS17080049', 'SS18050220', 'SS17090061', 'SS17050008')) for update 
