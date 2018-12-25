select pk_jkbx
  from er_bxzb
 where djbh = '81300CL18120055';

  select defitem26,defitem27,zfybje ,zfbbje 
    from er_busitem
   where pk_jkbx =
         (select pk_jkbx from er_bxzb where djbh = '81300CL18110256') 
         for update 
 
