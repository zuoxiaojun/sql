
--��ѯ�������ˮ����
select b.name,
       vbillcode,
       c.code,
        c.name,
       substr(a.dbilldate, 1, 10) "dbilldate",
       noutnum,
       ninnum
  from ic_flowaccount_his a
  left join org_stockorg b
    on a.pk_org = b. pk_stockorg
  left join bd_material c
    on a.cmaterialvid = c. pk_material
 where substr(a.dbilldate, 1, 10) > '2018-01-01'
