select crowno, nnum, nordnum, norigtaxmny, nordsum
  from ct_sale_b
 where pk_ct_sale in (select pk_ct_sale
                        from ct_sale
                       where vbillcode = 'GCL/XZXY-XS-2019-0033'
                         and blatest = 'Y')
                         
   for update

