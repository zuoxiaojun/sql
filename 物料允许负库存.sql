select code
  from bd_material
 where pk_material in
       (select pk_material from bd_materialstock where negallowed = 'Y')--查询允许负库存物料
