

select a2.code, a2.name, a1.code, a1.name
  from org_dept a1
  left join org_orgs a2
    on a1.pk_org = a2.pk_org
 where a1.pk_dept in (select pk_dept
                        from (select count(pk_orgmanager) a, pk_dept
                                from org_orgmanager
                               group by pk_dept)
                       where a = '2')
   and a1.enablestate = '2'

