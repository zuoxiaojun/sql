select a.vpathcode "����·������",
       a.vpathname "����·������",
       b.name      "����������֯",
       c.name      "���������֯ "
  from to_settlepath a
  left join org_financeorg b
    on a.coutfinanceorgid = b.pk_financeorg
  left join org_financeorg c
    on a.cinfinanceorgid = c.pk_financeorg
 where a.dr = 0
   and a.blatestflag = 'Y'
