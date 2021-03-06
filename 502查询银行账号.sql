select a.psncode 工号, a.psnname 姓名, c.bankname 银行, c.bankacc 账户
  from bd_psndoc a, bd_psnaccbank b, bd_accbank c
 where a.pk_corp = '1344'
   and b.PK_PSNBASDOC = a.PK_PSNBASDOC
   and b.pk_accbank = c.pk_accbank
 order by psncode;
 
 select a.psncode 工号, a.psnname 姓名, c.bankname 银行, c.bankacc 账户
   from bd_psndoc a
   left join bd_psnaccbank b
     on a.PK_PSNBASDOC = b.PK_PSNBASDOC
   left join bd_accbank c
     on b.pk_accbank = c.pk_accbank
  where a.pk_corp = '1344'
  order by psncode;
