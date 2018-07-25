select a.vbillcode, b.user_name, a.dbilldate
  from ct_sale a
  left join sm_user b
    on a.billmaker = b.cuserid
 where a.dr = 0
 and a.blatest ='Y'

