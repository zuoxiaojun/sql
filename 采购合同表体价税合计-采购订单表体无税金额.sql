select nglobaltaxmny, ngrouptaxmny, norigtaxmny, ntaxmny
  from ct_pu_b
 where pk_ct_pu = (select pk_ct_pu
                     from ct_pu
                    where vbillcode = 'GCL/ZJGJC-CG/LX20180156')  --采购合同表体价税合计
   --for update


select ngroupmny, nglobalmny, norigmny
  from po_order_b
 where pk_order =
       (select pk_order from po_order where vbillcode = 'GCL/ZJGJC-CG/LX20180156') for update  --采购订单表体无税金额
