select djbh, creationtime, pk_jkbx
  from er_bxzb
 where pk_org_v = (select pk_vid from org_financeorg_v where code = '833')
 
 
 --������Ϣ��ͼ��ȡ���ݵĵ�һ��������Ϣ
select min(senddate) senddate, billid from pub_workflownote group by billid


--������ѯ
select a.djbh, a.creationtime, b.senddate
  from er_bxzb a
  left join (select min(senddate) senddate, billid
               from pub_workflownote
              group by billid) b
    on a.pk_jkbx = b.billid
 where pk_org_v = (select pk_vid from org_financeorg_v where code = '833')
   and a.dr = 0



select count(*) from pub_workflownote
