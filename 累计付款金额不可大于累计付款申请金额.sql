--累计付款金额不可大于累计付款申请金额（数据回写问题）
--付款申请单表体
--付款计划回写
select  pk_apply  from  cmp_apply where vbillno ='SS18040180'--1001D1100000009INT64

select olcapplymny, glcapplymny, olcorigapplymny, origapplymny,olcrate 
  from cmp_apply_b
 where pk_apply = '1001D1100000009INT64'
   for update;

select naccumpayappmny, naccumpayapporgmny,nexchangerate 
  from ct_payplan
 where pk_ct_pu = (select pk_ct_pu
                     from ct_pu
                    where vbillcode = 'GCL/XMBU-CG-2017-0682号') for update --1312717.56000000
