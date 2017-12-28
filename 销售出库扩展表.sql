select nsignnum
  from ic_saleout_e
 where cgeneralbid in (select cgeneralbid
                        from ic_saleout_b
                       where cgeneralhid =
                             (select cgeneralhid
                                from ic_saleout_h
                               where vbillcode = '81800XC20170905007' and dr=0)                     
                      ) 
     
