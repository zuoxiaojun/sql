--累计付款金额不可大于累计付款申请的金额（外币汇率导致）
--付款申请汇率大于合同汇率
--处理过程，将单据改成自由态，修改好汇率后再将单据状态改回来（表头表体都要）
              3                         1    
select busistatus,
       vbillstatus,
       modifiedtime,
       modifier,
       olcrate,
       dr    
  from cmp_apply
 where vbillno = 'SS18080268'
   for update --汇率问题导致付款单保存报错  累计付款金额不可大于累计付款申请的金额


select busistatus,
       vbillstatus,
       olcrate  
  from cmp_apply_b
 where pk_apply =
       (select pk_apply from cmp_apply where vbillno = 'SS18080268')
   for update



/*付款申请单未付金额错误*/

select busistatus,
       vbillstatus,
       olcrate  ,
       glcpaymny ,
       gllcpaymny ,
       olcpaymny ,paymny ,
       gllcunpaymny ,
       glcunpaymny ,
       olcunpaymny ,
       unpaymny 
  from cmp_apply_b
 where pk_apply =
       (select pk_apply from cmp_apply where vbillno = 'SS18040180')
   for update
