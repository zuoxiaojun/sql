select code, name, pk_inoutbusiclass
  from bd_inoutbusiclass
 where name = '管理费用-国内差旅费' --1001A1100000000042HN


select szxmid  from er_busitem where pk_jkbx =(select pk_jkbx  from er_bxzb where djbh='81600CL18120044') for update 
