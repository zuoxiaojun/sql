select a.vpathcode "结算路径编码",
       a.vpathname "结算路径名称",
       b.name      "调出财务组织",
       c.name      "调入财务组织 "
  from to_settlepath a
  left join org_financeorg b
    on a.coutfinanceorgid = b.pk_financeorg
  left join org_financeorg c
    on a.cinfinanceorgid = c.pk_financeorg
 where a.dr = 0
   and a.blatestflag = 'Y'
