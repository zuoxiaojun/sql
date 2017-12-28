SELECT 
       bd_psndoc.code      code
  FROM bd_psndoc bd_psndoc
  LEFT JOIN org_adminorg meta
    ON bd_psndoc.pk_org = meta.pk_adminorg
 WHERE meta.code = '821'

select cuserid
  from sm_user
 where user_code in (SELECT bd_psndoc.code code
                       FROM bd_psndoc bd_psndoc
                       LEFT JOIN org_adminorg meta
                         ON bd_psndoc.pk_org = meta.pk_adminorg
                      WHERE meta.code = '821')       --π˝¬À»À‘±
