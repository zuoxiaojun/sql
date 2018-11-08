select sum(ntaxmny)
  from po_invoice_b
 where vctcode = 'GCL/XZJC-CG/QT-2017-003'
   and dr = 0
