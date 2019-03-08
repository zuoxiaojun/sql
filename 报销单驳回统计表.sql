
/*
approveresult 审批意见枚举值
R 驳回
Y 批准
T 改派
N 不批准
*/

select dealdate, --审批日期
       pk_org, --组织
       billid, --单据pk
       decode(pk_billtype,
              '264X-Cxx-002',
              '通用费用报销单',
              '264X-Cxx-001',
              '交通住宿费报销单',
              '2641',
              '差旅费报销单',
              '2647',
              '还款单',
              '2642',
              '交通费报销单') jylx, --交易类型
       billno, --单据号
       checknote, --驳回意见
       checkman, --审批人
       approveresult,
       pk_jkbx,
       jkbxr,
       bbje
  from (select dealdate,
               pk_org,
               billid,
               pk_billtype,
               billno,
               checknote,
               checkman, --审批人
               approveresult
          from pub_workflownote
         where checknote is not null
           and approveresult = 'R' --只取驳回 
           and pk_billtype in ('264X-Cxx-002','264X-Cxx-001','2641','2647','2642')
        -- and  billno = '80200CL18110326'
        ) a
  left join (select pk_jkbx, jkbxr, bbje
               from (select pk_jkbx, jkbxr, bbje
                       from er_bxzb
                     --where djbh = '80200CL18110326'
                     )) b
    on a.billid = b.pk_jkbx
    
 --where billno = '80200CL18110326'

/*select  * from bd_billtype where   pk_billtypecode ='2641'
 
   select *  from user_indexes where table_name='PUB_WORKFLOWNOTE'
   
   create index idx_pub_workflownote on pub_workflownote(billno)
 
   
   
   select billno from pub_workflownote where approveresult='T'

*/
