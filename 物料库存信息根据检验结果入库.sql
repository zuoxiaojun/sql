select stockbycheck  from bd_materialstock where  pk_material (select pk_material from bd_material where code in  (select code from xxxx))
