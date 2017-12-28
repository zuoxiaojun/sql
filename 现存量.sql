SELECT
    A .pk_org,--库存组织
    A .cwarehouseid ,--仓库
    A.cmaterialoid,--物料
    B.nonhandastnum,--结存数量
    B.nonhandnum --结存主数量  
FROM
    ic_onhanddim A
LEFT JOIN ic_onhandnum B ON A .pk_onhanddim = B.pk_onhanddim
where A.pk_org=(select pk_org from org_stockorg where name ='阜宁协鑫集成科技有限公司')
and A.cmaterialoid=(select pk_material from bd_material where code ='0105030053')
