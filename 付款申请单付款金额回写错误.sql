select pk_apply,
       applysum, --申请付款金额合计 
       applymny_cap,
       olcrate ,--组织本币汇率
       olcactualpaysum, --实付金额合计(组织本币)
       actualpaysum, --实付金额合计
       olcorigapplysum, --原始付款金额合计(组织本币) 
       olcpaysum, --付款金额合计(组织本币)   
       paysum, --付款金额合计                    49459286.4000
       glcunpaysum, --未付金额合计(集团本币)      2316561.60000
       gllcunpaysum, --未付金额合计(全局本币)
       olcunpaysum, --未付金额合计(组织本币)
       unpaysum, --未付金额合计                   
       busistatus --1=待提交，2=待审批，3=待生成，4=部分生成，5=已生成，-1=自由态， 
  from cmp_apply
 where vbillno = 'SS19040224'
   --and pk_apply = '1001D110000000H217Y2'
   for update --1001D110000000H217Y2
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
 where pk_apply = '1001D110000000H217Y2'
   for update
