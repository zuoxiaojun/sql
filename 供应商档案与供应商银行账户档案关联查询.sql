--��Ӧ�̵����빩Ӧ�������˻�����������ѯ

select a.pk_cust, b.accname, b.accnum, c.name, c.code
  from bd_custbank a
  left join bd_bankaccsub b
    on a.pk_bankaccsub = b.pk_bankaccsub
  left join bd_supplier c
    on a.pk_cust = c.pk_supplier
