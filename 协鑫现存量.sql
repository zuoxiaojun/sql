SELECT
    A .pk_org,
    A .cmaterialoid,
    SUM (b.nonhandnum) znum,
    SUM(b.nonhandastnum ) num
FROM
    ic_onhanddim A
LEFT JOIN ic_onhandnum b ON A .pk_onhanddim = b.pk_onhanddim
GROUP BY
    A .pk_org,
    A .cmaterialoid; --�������֯�����ϻ���
select code from bd_material where pk_material ='1001A1100000000061BP'   --0105160003
select name from org_stockorg where   pk_stockorg  ='0001A110000000002UUY'
--�������֯�����ϻ���

select *
  from (SELECT A.pk_org,
               A.cmaterialoid,
               SUM(b.nonhandnum)  znum,
               SUM(b.nonhandastnum) num
          FROM ic_onhanddim A
          LEFT JOIN ic_onhandnum b
            ON A.pk_onhanddim = b.pk_onhanddim
         GROUP BY A.pk_org, A.cmaterialoid)
 where pk_org =
       (select pk_stockorg from org_stockorg where name = '������ҵ��80102') --'0001A110000000002UUY'
   and CMATERIALOID =
       (select pk_material from bd_material where code = '0105160003') --'1001A1100000000061BP'
