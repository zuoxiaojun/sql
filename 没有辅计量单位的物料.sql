

select code, name
  from bd_material
 where pk_material in (select pk_material
                         from bd_material
                        where dr = 0
                       minus
                       select pk_material
                         from bd_materialconvert
                        where dr = 0)    --没有辅计量单位的物料
                        and  code like '04%'


select a.code, a.name, b.pk_apartmeasdoc
  from bd_material a
  left join bd_materialconvert b
    on a.pk_material = b.pk_material
 where a.code = '0415010756'
