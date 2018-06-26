
--根据单据查找对应其对应的审批流

select   PROCESSDEFID --审批流定义主键
  from pub_wf_instance
 where billid = (select pk_apply
                   from cmp_apply
                  where vbillno = 'SS18061996'
                    and APPLYDATE = '2018-06-30 23:59:59')  --1001D110000000ALN7Q3


select * from pub_wf_def where  pk_wf_def ='1001D110000000ALN7Q3' --审批流

select * from org_orgs where pk_org='0001B110000000007JO0'

