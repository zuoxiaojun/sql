select sum(ntaxmny)
  from po_invoice_b
 where vctcode = 'GCL\813-825\VINA-201801203'
   and dr = 0
