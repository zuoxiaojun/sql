select a.code,a.name,b.pk_measdoc 
  from bd_material a
  left join bd_materialconvert b
    on a.pk_material = b.pk_material where b.pk_measdoc  is null  --查询辅计量单位为空
