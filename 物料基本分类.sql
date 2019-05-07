--物料基本分类

select a.code, a.name, a.pk_parent, b.name
  from bd_marbasclass a
  left join bd_marbasclass b
    on a.pk_parent = b.pk_marbasclass
