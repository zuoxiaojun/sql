select pk_apply,
       olcactualpaysum,--实付金额合计(组织本币)
       olcorigapplysum,--原始付款金额合计(组织本币) 
       olcpaysum,--付款金额合计(组织本币)
       paysum,    --付款金额合计                          1470567.95000000
       glcunpaysum,--未付金额合计(集团本币)      2195049.84
       gllcunpaysum,--未付金额合计(全局本币)
       olcunpaysum,--未付金额合计(组织本币)
       unpaysum--未付金额合计
  from cmp_apply
 where vbillno = 'SS18071903'
   for update --1001D110000000AAY0ZQ
 
 select paymny, --累计付款金额
        olcpaymny, --累计付款金额 组织本币
        gllcapplymny,--申请付款金额(全局本币)
        dr,
        glcunpaymny ,
        gllcunpaymny ,
        olcunpaymny ,
        unpaymny 
   from cmp_apply_b
  where pk_apply = '1001D110000000AAY0ZQ'
    for update
