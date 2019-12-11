select *
  from EHR_SYNONYMS_CUX_HR2ZJ_TM
 where psncode in (select code from bd_psndoc where name = '')


select code name from bd_psndoc where name = '';

select * from user_jobs;
