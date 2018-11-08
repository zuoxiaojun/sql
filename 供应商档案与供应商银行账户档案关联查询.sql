--供应商档案与供应商银行账户档案关联查询

select a.pk_cust, b.accname, b.accnum, c.name, c.code
  from bd_custbank a
  left join bd_bankaccsub b
    on a.pk_bankaccsub = b.pk_bankaccsub
  left join bd_supplier c
    on a.pk_cust = c.pk_supplier
