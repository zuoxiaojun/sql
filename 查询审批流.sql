--��ѯ������
select b.name,
       a.node_name,
       a.billtype,
       c.billtypename,
       decode(a.emendenum, 0, '�޶�', -1, '��ͨ') emendenum,
       decode(a.validity, 1, '����', 2, 'δ����', 0, 'ͣ��') validity,
       a.version
  from pub_wf_def a
  left join org_orgs b
    on a.pk_org = b. pk_org
  left join bd_billtype c
    on a. billtype = c.pk_billtypecode
 where a.workflow_type = 2
