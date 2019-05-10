

SELECT A.pk_org, --库存组织
       A.cwarehouseid, --仓库
       a.vbatchcode, --批次
       a.pk_batchcode,
       A.cmaterialoid, --物料
       B.nonhandastnum, --结存数量
       B.nonhandnum --结存主数量  
  FROM ic_onhanddim A
  LEFT JOIN ic_onhandnum B
    ON A.pk_onhanddim = B.pk_onhanddim
 where A.pk_org = (select pk_stockorg from org_stockorg where code = '813')
   and A.cmaterialoid =
       (select pk_material from bd_material where code = '0104121753')
   and b.nonhandnum <> 0
   
   
   --修改调拨出库单批次
   select crowno,pk_batchcode,vbatchcode,nnum
     from ic_transout_b
    where cgeneralhid =
          (select cgeneralhid
             from ic_transout_h
            where vbillcode = '81300DC20190509052') for update 


select pk_batchcode, vbatchcode, crowno, nshouldoutnum
  from ic_flow
 where vbillcode = '81300DC20190509052' for update 

