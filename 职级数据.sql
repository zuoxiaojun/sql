select *
  from EHR_SYNONYMS_CUX_HR2ZJ_TM
 where psncode in (select code from bd_psndoc where name = '���ȷ�')


select code name from bd_psndoc where name = ''
