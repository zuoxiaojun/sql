
--���ݵ��ݲ��Ҷ�Ӧ���Ӧ��������

select   PROCESSDEFID --��������������
  from pub_wf_instance
 where billid = (select pk_apply
                   from cmp_apply
                  where vbillno = 'SS18090068'
                    and APPLYDATE = '2018-09-06 23:59:59')  --1001D110000000ALN7Q3


select * from pub_wf_def where  pk_wf_def ='1001D110000000ALN7Q3' --������

select * from org_orgs where pk_org='0001B110000000007JO0'

select * from pub_wf_def where CREATEDATE='2019-03-20 17:17:16' for update 



