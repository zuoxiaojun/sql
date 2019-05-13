SELECT bd_material.pk_group          pk_group,
       bd_material.pk_org            pk_org,
       bd_material.code              code,
       bd_material.name              maname,
       bd_material.materialspec      materialspec,
       bd_material.materialtype      materialtype,
       bd_material.pk_measdoc        pk_measdoc,
       bd_material.pk_marbasclass    pk_marbasclass,
       bd_materialconvert.pk_measdoc fpk_measdoc,
       bd_materialconvert.measrate   measrate
  FROM bd_material bd_material
  LEFT JOIN bd_materialconvert bd_materialconvert
    ON (bd_material.pk_material = bd_materialconvert.pk_material)
 WHERE bd_material.dr = 0
