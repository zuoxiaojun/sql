
--根据采购合同查找对应其对应的审批流

select   PROCESSDEFID --审批流定义主键
  from pub_wf_instance
 where billid in (select  pk_ct_pu 
                   from ct_pu
                  where vbillcode  = 'GCL/XXJC-CG-ZLBB-201804'               --1001D1100000009WVW8E
                  and blatest ='Y'
                    --and APPLYDATE = '2018-09-06 23:59:59'
                    )  --1001D110000000ALN7Q3
                    
                    
select * from pub_wf_def where  pk_wf_def ='1001D110000000ALN7Q3' --审批流

select * from org_orgs where pk_org='0001B110000000007JO0'

select senderman, messagenote, billid, billno, ischeck
  from pub_workflownote
 where billno = 'GCL/XXJC-CG-ZLBB-201804'
 --  for update

select pk_ct_pu, version
  from ct_pu
 where vbillcode = 'GCL/XXJC-CG-ZLBB-201804' --1001D1100000009WVW8E
   and blatest = 'Y' 

