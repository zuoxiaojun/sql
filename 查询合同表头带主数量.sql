select b.vbillcode, b.ctname, a.snnum, c.name vdef4name
  from (select pk_ct_pu, sum(nnum) snnum
          from ct_pu_b
         where dr = 0
         group by pk_ct_pu) a
  left join ct_pu b
    on a.pk_ct_pu = b.pk_ct_pu
  left join bd_defdoc c
    on b.vdef4 = c.pk_defdoc
 where b.blatest = 'Y'
