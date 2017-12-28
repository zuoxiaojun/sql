SELECT er_bxzb.operator billmaker,
       er_bxzb.pk_fiorg org,
       substr(er_bxzb.djrq, 1, 10) billdate,
       bd_billtype.pk_billtypeid pk_billtypeid,
       count(distinct er_bxzb.pk_jkbx) num
  FROM er_bxzb er_bxzb
  LEFT JOIN bd_billtype bd_billtype
    ON (er_bxzb.djlxbm = bd_billtype.pk_billtypecode)
 WHERE er_bxzb.dr = 0
   AND er_bxzb.djzt IN (2)
   /*and operator  =
       (select cuserid from sm_user where user_name = 'Carlos Arguedas')
   and substr(creationtime,1,10) = '2016-10-08'*/
   and bd_billtype.pk_group='0001A110000000000MFL'
 GROUP BY er_bxzb.operator,
          er_bxzb.pk_fiorg,
          substr(er_bxzb.djrq, 1, 10),
          bd_billtype.pk_billtypeid,
          bd_billtype.pk_group
