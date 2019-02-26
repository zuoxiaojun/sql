--物料档案查询
select --a.pk_material,
 b.name       fl,
 a.code       wlcode,
 a.name       wlname,
 materialspec,
 -- materialtype,
 c.name zdwname
  from bd_material a
  left join bd_marbasclass b
    on a.pk_marbasclass = b.pk_marbasclass
  left join bd_measdoc c
    on a.pk_measdoc = c.pk_measdoc
