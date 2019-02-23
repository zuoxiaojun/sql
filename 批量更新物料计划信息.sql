select pk_material,code,name from bd_material where pk_material='1001S31000000001FHO6'

--批量更新物料计划信息

--更新批量规则
update bd_materialplan set batchrule ='JJ' where pk_org='0001W210000000000RNR'

select count(*) from wljh where pk_material1 is not null;

--更新economicbatch 经济批量
update bd_materialplan set economicbatch =
(select economicbatch from wljh b where pk_material = b.pk_material1 )
where pk_org='0001W210000000000RNR'

--更新batchincrnum  批量增量
update bd_materialplan set batchincrnum =
(select batchincrnum from wljh b where pk_material = b.pk_material1 )
where pk_org='0001W210000000000RNR'

--更新fixedahead 固定提前期
update bd_materialplan set fixedahead =
(select fixedahead from wljh b where pk_material = b.pk_material1 )
where pk_org='0001W210000000000RNR'



select dr,economicbatch ,pk_org  from bd_materialplan where pk_material ='1001S31000000001FHO6'
--pk_org='0001W210000000000RNR'
