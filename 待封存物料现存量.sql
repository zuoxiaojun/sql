/*         ´ý·â´æÎïÁÏÏÖ´æÁ¿       */

SELECT A.pk_org,
       A.cmaterialoid,
       a.cwarehouseid,
       SUM(b.nonhandnum) znum,
       SUM(b.nonhandastnum) num
  FROM ic_onhanddim A
  LEFT JOIN ic_onhandnum b
    ON A.pk_onhanddim = b.pk_onhanddim
 where a.cmaterialoid in
       (select pk_material from bd_material where name like '%´ý·â´æ%')
 GROUP BY A.pk_org, A.cmaterialoid, a.cwarehouseid



select *
  from (SELECT A.pk_org,
               A.cmaterialoid,
               a.cwarehouseid,
               SUM(b.nonhandnum) znum,
               SUM(b.nonhandastnum) num
          FROM ic_onhanddim A
          LEFT JOIN ic_onhandnum b
            ON A.pk_onhanddim = b.pk_onhanddim
         where a.cmaterialoid in
               (select pk_material
                  from bd_material
                 where name like '%´ý·â´æ%')
         GROUP BY A.pk_org, A.cmaterialoid, a.cwarehouseid)
 where znum <> 0



select * from org_stockorg where  pk_stockorg ='0001A110000000002UUY'
