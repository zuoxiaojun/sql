select a.code,b.name
  from bd_material a
  left join bd_branddoc b
    on a. pk_brand = b.pk_brand

--更新物料品牌名称字段到助记码上
update bd_material a
   set a.materialmnecode =
       (select b.name from bd_branddoc b where a.pk_brand = b. pk_brand)
 where exists (select 1 from bd_branddoc b where a.pk_brand = b. pk_brand)


update bd_material_v a
   set a.materialmnecode =
       (select b.name from bd_branddoc b where a.pk_brand = b. pk_brand)
 where exists (select 1 from bd_branddoc b where a.pk_brand = b. pk_brand)


