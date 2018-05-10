--累计付款金额不可大于累计付款申请金额（数据回写问题）
--付款申请单表体
--付款计划回写
select  pk_apply  from  cmp_apply where vbillno ='SS18020175'--1001D1100000009G5D7T

select olcapplymny, glcapplymny, olcorigapplymny, origapplymny
  from cmp_apply_b
 where pk_apply = '1001D1100000009G5D7T'
   for update;

select naccumpayappmny, naccumpayapporgmny
  from ct_payplan
 where pk_ct_pu = (select pk_ct_pu
                     from ct_pu
                    where vbillcode = 'GCL/XMUB-CG-2018-0037号') for update
