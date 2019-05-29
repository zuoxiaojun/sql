--查询审批流
select b.name,
       a.node_name,
       a.billtype,
       c.billtypename,
       decode(a.emendenum, 0, '修订', -1, '普通') emendenum,
       decode(a.validity, 1, '启用', 2, '未启用', 0, '停用') validity,
       a.version
  from pub_wf_def a
  left join org_orgs b
    on a.pk_org = b. pk_org
  left join bd_billtype c
    on a. billtype = c.pk_billtypecode
 where a.workflow_type = 2
