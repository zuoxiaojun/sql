select code, name, pk_inoutbusiclass
  from bd_inoutbusiclass
 where name = '�������-��������ʹ�÷�' --1001A1100000000042HN


select szxmid  from er_busitem where pk_jkbx =(select pk_jkbx  from er_bxzb where djbh='81600JT18120032') for update 
