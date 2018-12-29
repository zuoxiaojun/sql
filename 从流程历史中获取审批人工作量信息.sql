--从流程历史中获取审批人工作量信息

select *
  from (select a.checkman checkman,
               a.pk_org pk_org,
               substr(a.dealdate, 1, 10) dealdate,
               b.pk_billtypeid pk_billtypeid,
               a.billno,
               c.fjzs
          from pub_workflownote a
          left join bd_billtype b
            on (b.pk_billtypecode = a.pk_billtype and
               b.pk_group = '0001A110000000000MFL')
          left join er_bxzb c
            on a.billno = c.djbh
         where c.dr = '0')
 where pk_billtypeid in
       (select pk_billtypeid
          from bd_billtype
         where pk_billtypecode in
               ('264X-Cxx-001', '264X-Cxx-002', '2641', '2647', '2642')
           and pk_group = '0001A110000000000MFL')
   and checkman in
       (select cuserid
          from sm_user
         where user_code in (select bd_psndoc.code code
                               from bd_psndoc bd_psndoc
                               left join org_adminorg meta
                                 on bd_psndoc.pk_org = meta.pk_adminorg
                              where meta.code = '821'))

