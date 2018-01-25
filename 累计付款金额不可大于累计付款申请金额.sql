--累计付款金额不可大于累计付款申请金额（数据回写问题）
--付款申请单表体
--付款计划回写
select  pk_apply  from  cmp_apply where vbillno ='SS17121792';--1001D1100000007WFCA5

select olcapplymny, glcapplymny, olcorigapplymny, origapplymny
  from cmp_apply_b
 where pk_apply = '1001D1100000007WFCA5'
   for update;

select naccumpayappmny, naccumpayapporgmny
  from ct_payplan
 where pk_ct_pu = (select pk_ct_pu
                     from ct_pu
                    where vbillcode = '共享中心2017年2-11月服务费') for update
