select defitem2, defitem9
  from er_busitem
 where pk_jkbx =
       (select pk_jkbx from er_bxzb where djbh = '80200CL18060434') for update  --�޸ı�������������


select * from GCL_EHR_CUX_HR2FIN_TMGF where vbillno='0000065059' for update   --��������
