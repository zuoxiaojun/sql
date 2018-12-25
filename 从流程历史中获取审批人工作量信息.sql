--从流程历史中获取审批人工作量信息

SELECT pub_workflownote.checkman checkman,
       pub_workflownote.pk_org pk_org,
       substr(pub_workflownote.dealdate, 1, 10) dealdate,
       bd_billtype.pk_billtypeid pk_billtypeid,
       count(pub_workflownote.pk_checkflow) num
  FROM pub_workflownote pub_workflownote
  LEFT JOIN bd_billtype bd_billtype
    ON (bd_billtype.pk_billtypecode = pub_workflownote.pk_billtype AND
       bd_billtype.pk_group = '0001A110000000000MFL')
 where checkman = '1001D1100000007XTZT8'
   and substr(pub_workflownote.dealdate, 1, 10) = '2018-12-24'
 GROUP BY pub_workflownote.checkman,
          pub_workflownote.pk_org,
          substr(pub_workflownote.dealdate, 1, 10),
          bd_billtype.pk_billtypeid;
          
          
          
           select cuserid
             from sm_user
            where user_name = '陈文雅' --1001D1100000007XTZT8
