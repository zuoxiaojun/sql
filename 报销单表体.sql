select defitem27,defitem22
  from er_busitem
 where pk_jkbx =
       (select pk_jkbx from er_bxzb where djbh = '80501BX18110151') for update  --修改报销单表体数据


select * from GCL_EHR_CUX_HR2FIN_TMGF where vbillno='0000065059' for update   --出差申请
