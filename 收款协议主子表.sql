--�տ�Э�����ӱ�
select *
  from bd_income a
  left join bd_incomech b
    on a. pk_income = b.pk_payment
