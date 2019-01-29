select *
  from gl_detail gl_detail, gl_docfree1
 where gl_detail.assid = gl_docfree1.assid
   and gl_detail.pk_accasoa = '1001A110000000000FD6'
   and gl_detail.yearv = '2019'
   and gl_detail.adjustperiod >= '01'
   and gl_detail.adjustperiod <= '01'
   and gl_detail.pk_accountingbook = '1001D110000000C0VU0S'
   and gl_detail.discardflagv <> 'Y'
  and gl_detail.dr = 0
   and gl_detail.voucherkindv <> 255
   and gl_detail.pk_managerv = 'N/A'
   and gl_detail.voucherkindv <> 4
   and gl_detail.voucherkindv <> 5
   --and gl_docfree1.F11 = '1001D110000000C9HTRA'
   and 1 = 1
   
   SELECT * from bd_accassitem--cd1f9a1c-eb08-493f-88ff-bcd1c134dee1
   select * from md_class where id='cd1f9a1c-eb08-493f-88ff-bcd1c134dee1'
   select * from bd_bankaccsub where pk_bankaccsub='1001D110000000C9HTRA'--3050020010120100247366
   select * from bd_bankaccsub where code='3050020010120100247366' for update 
   
 
 order by gl_detail.pk_accountingbook,
          gl_detail.yearv,
          gl_detail.pk_accasoa,
          gl_detail.assid
