--累计付款金额不可大于累计付款申请金额（数据回写问题）
--付款申请单表体
--付款计划回写
select  pk_apply  from  cmp_apply where vbillno ='SS18051874'--1001D110000000ADM8W7

select olcapplymny, glcapplymny, olcorigapplymny, origapplymny,olcrate 
  from cmp_apply_b
 where pk_apply = '1001D110000000ADM8W7'
   for update;

select naccumpayappmny, --累计付款申请本币金额
naccumpayapporgmny, --累计付款申请金额
nexchangerate
  from ct_payplan
 where pk_ct_pu = (select pk_ct_pu
                     from ct_pu
                    where vbillcode = 'GCL/XXJC-SJX-2018-0017')
   for update --1312717.56000000
