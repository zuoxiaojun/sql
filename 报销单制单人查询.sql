select a.creator, b.user_code, b.user_name, a.djbh, a.djrq
  from er_bxzb a
  left join sm_user b
    on a.creator = b.cuserid
 where a.djrq > ('2018-01-01 00:00:00')
   and a.dr = 0
order by djrq desc
