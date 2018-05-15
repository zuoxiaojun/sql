select sum(a.ntaxmny)
  from po_invoice_b a
  left join po_invoice c
    on a.pk_invoice = c.pk_invoice
  left join sc_order_b b
    on a.cfirstbid = b.pk_order_b
 where b.pk_ct_pu = '1001D1100000000HEDHI'
   and fbillstatus = '3'
   and nvl(a.dr, 0) = 0
   and nvl(b.dr, 0) = 0



       select pk_ct_pu
          from ct_pu
         where vbillcode = 'GCL/FNJC-CG-2016-0207' and blatest ='Y'  --1001D1100000000S6ENN          ºÏÍ¬Ö÷¼ü


select sum(ntaxmny)
  from po_invoice_b
 where cfirstid in 
       (select pk_order from sc_order where vbillcode = '612016093000000027' and dr=0 and blatestflag='Y') and dr=0


