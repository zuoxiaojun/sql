select busistatus,
       pk_apply,
       applysum, --申请付款金额合计 
       applymny_cap,
       olcactualpaysum, --实付金额合计(组织本币)
       olcorigapplysum, --原始付款金额合计(组织本币) 
       olcpaysum, --付款金额合计(组织本币)
       paysum, --付款金额合计                     8500000
       glcunpaysum, --未付金额合计(集团本币)      1250331.5
       gllcunpaysum, --未付金额合计(全局本币)
       olcunpaysum, --未付金额合计(组织本币)
       unpaysum --未付金额合计
  from cmp_apply
 where vbillno = 'SS19033371'
--and pk_apply='1001D110000000G0ZPOX'
   for update --1001D110000000ADM8W7
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
       unpaymny
  from cmp_apply_b
 where pk_apply = '1001D110000000G0ZPOX'
   for update
