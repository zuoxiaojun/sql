select *
  from ic_flowaccount_his
 where cmaterialoid in
       (select pk_material from bd_material where code = '0105090702')
--�����������κ�

select wholemanaflag
  from bd_materialstock
 where pk_material =
       (select pk_material from bd_material where code = '0105090702')
   and pk_org = (select pk_stockorg from org_stockorg where code = '813')
