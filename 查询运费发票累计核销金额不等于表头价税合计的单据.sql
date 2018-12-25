select cinvoice_hid ,ntotaltaxmny  from dm_apinvoice
minus 
select cinvoice_hid,sum(nverifymny ) from dm_apinvoice_b group by cinvoice_hid


select cinvoice_hid
  from (select cinvoice_hid, ntotaltaxmny
          from dm_apinvoice
        minus
        select cinvoice_hid, sum(nverifymny)
          from dm_apinvoice_b
         group by cinvoice_hid)


select vbillcode
  from dm_apinvoice
 where cinvoice_hid in (select cinvoice_hid
                          from (select cinvoice_hid, ntotaltaxmny
                                  from dm_apinvoice
                                minus
                                select cinvoice_hid, sum(nverifymny)
                                  from dm_apinvoice_b
                                 group by cinvoice_hid))
      
   and dr = 0
