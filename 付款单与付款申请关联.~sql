
--付款单与付款申请关联

--先找一条关联对照数据
 select CONTRACTNO,
        TOP_BILLID,
        TOP_BILLTYPE,
        TOP_ITEMID
   from ap_payitem
  where billno = '80100FK18120216'
    and dr = 0 
    
--2	GCL/XXJC-NBJY-2018-0230	1001D110000000EITNQD	36D1	1001D110000000EITNQE

select billno,
       CONTRACTNO,
       TOP_BILLID,
       TOP_BILLTYPE,
       TOP_ITEMID,
       --构成关联的字段
       dr
  from ap_payitem
 where billno = '80100FK19050100'
   and dr = 0
   for update
     ;
 
 
   
   --根据付款申请查询下游生成的付款单的金额
select billno, sum(money_de)
  from ap_payitem
 where top_itemid in
       (select pk_apply_b
          from cmp_apply_b
         where pk_apply in
               (select pk_apply
                  from cmp_apply
                 where vbillno = 'SS19013217'
                   and dr = '0'
                   and pk_acceptorg = (select pk_financeorg
                                         from org_financeorg
                                        where code = '801'))) --财务组织
   and dr = 0
 group by billno;
   
   --回写金额错误
   select pk_apply,
       applysum, --申请付款金额合计 
       applymny_cap,
       olcrate ,--组织本币汇率
       olcactualpaysum, --实付金额合计(组织本币)
       actualpaysum, --实付金额合计
       olcorigapplysum, --原始付款金额合计(组织本币) 
       olcpaysum, --付款金额合计(组织本币)   
       paysum, --付款金额合计                    82803843.87
       glcunpaysum, --未付金额合计(集团本币)     3181545.33
       gllcunpaysum, --未付金额合计(全局本币)
       olcunpaysum, --未付金额合计(组织本币)
       unpaysum, --未付金额合计                   
       busistatus --1=待提交，2=待审批，3=待生成，4=部分生成，5=已生成，-1=自由态， 
  from cmp_apply
 where vbillno = 'SS19013217'
   and pk_apply = '1001D110000000EITNQD'
   for update --1001D110000000EITNQD
;

select paymny, --累计付款金额
       olcpaymny, --累计付款金额(组织本币)
       glcpaymny, --累计付款金额(集团本币) 
       gllcpaymny, --累计付款金额(全局本币)
       gllcapplymny, --申请付款金额(全局本币)
       dr,
       applymny, --申请付款金额
       glcapplymny, --申请付款金额(集团本币) 
       glcorigapplymny, --原始申请付款金额(集团本币)
       gllcapplymny, --申请付款金额(全局本币) 
       olcapplymny, --申请付款金额(组织本币)   
       glcunpaymny, --未付
       gllcunpaymny,
       olcunpaymny,
       unpaymny,
       busistatus
  from cmp_apply_b
 where pk_apply = '1001D110000000EITNQD'
   for update

   
