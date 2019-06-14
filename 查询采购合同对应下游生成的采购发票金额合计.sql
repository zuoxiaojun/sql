
--查询采购合同对应下游生成的采购发票金额合计
select sum(ngrouptaxmny)
  from po_invoice_b
 where cfirstbid in
       (select b.pk_order_b
          from po_order a
          left join po_order_b b
            on a.pk_order = b.pk_order
         where a.dr = 0
           and b.dr = 0
           and a.bislatest = 'Y'  --采购订单最新版本
           and ccontractid = (select pk_ct_pu
                                from ct_pu
                               where vbillcode = 'GCL/DSWF-CG-20180285'
                                 and dr = 0
                                 and blatest = 'Y'))



