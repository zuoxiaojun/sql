select *
  from sm_document_file
 where pk_billitem in
       (select pk_ct_pu from ct_pu where vbillcode = 'GCL/JZJC-XN-091')

select pk_ct_pu  from  ct_pu where vbillcode ='GCL/JZJC-XN-091'   --1001D1100000005BWK86  1001D1100000005EXK92  1001D1100000007I5NB8

select * from  sm_document_file 

select * from SM_PUB_FILESYSTEM  where filepath like '%1001D1100000005BWK86'
