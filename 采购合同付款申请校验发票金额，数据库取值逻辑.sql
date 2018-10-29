/*采购合同付款申请校验发票金额，数据库取值逻辑  */

     select pk_ct_pu
          from ct_pu
         where vbillcode = 'GCL/FNJC-CG-2016-0207' and blatest ='Y';  --1001D1100000000S6ENN          合同主键


select sum(ntaxmny)
  from po_invoice_b
 where cfirstid in (select pk_order
                      from po_order
                     where vbillcode in ('41501CD20170102002',
                                         '41501CD20161222001',
                                         '41501CD20160919007')
                       and dr = 0)
   and dr = 0l;
       
       select vsourcecode, csourceid
         from po_order_b
        where pk_order in
              (select pk_order
                 from po_order
                where vbillcode in ('41501CD20170102002',
               '41501CD20161222001','41501CD20160919007')) for update; --41501CD20161222001  采购订单来源单据



select ccontractid
  from po_order_b
 where pk_order in (select pk_order
                      from po_order
                     where vbillcode in ('41501CD20170102002',
                                         '41501CD20161222001',
                                         '41501CD20160919007'))   --合同主键    1001D1100000000S6ENN
   --for update                                           --采购订单表体合同主键（开发主要取值字段）



select sum(ntaxmny)
  from po_invoice_b
 where cfirstid in
       (select pk_order
          from po_order_b
         where ccontractid in (select pk_ct_pu
                                 from ct_pu
                                where vbillcode = 'GCL/DSWF-QT-20170091号'
                                  and blatest = 'Y')
           and dr = 0)
   and dr = 0 --取合同对应的发票总金额




