select DEFITEM26, DEFITEM27,bbje
  from er_busitem
 where pk_jkbx =
       (select pk_jkbx from er_bxzb where djbh = '82600CL18010016') for update

update er_busitem
   set DEFITEM26 =bbje,
   DEFITEM27=to_char(0.00) 
 where pk_jkbx =
       (select pk_jkbx from er_bxzb where djbh = '82600CL18010016')
