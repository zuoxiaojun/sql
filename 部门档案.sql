select b.code,
       b.name,
       a.pk_dept,
       a.code,
       a.name,
       a.pk_fatherorg,
       decode(a.enablestate, 1, '未启用', 2, '已启用', '已停用') enablestate
  from org_dept a
  left join org_orgs b
    on a.pk_org = b.pk_org
 where a.dr = '0'
--and b.code = '80501'
--and a.enablestate = '2'

select pk_dept ,code,name  from org_dept
