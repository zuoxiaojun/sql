select nnum,nassistnum, vbatchcode, pk_batchcode
  from ic_transout_b
 where cgeneralhid =
       (select cgeneralhid
          from ic_transout_h
         where vbillcode = '81300DC20190513053' and dr=0)
          for update
         

--现存量
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
   
   --库存流水
   select noutnum,noutassistnum, pk_batchcode, vbatchcode
     from ic_flow
    where vbillcode = '81300DC20190513053' for update 
   
--存货调拨出库单

select nnum, nastnum, vbatchcode
  from ia_ijbill_b
 where cbillid = (select cbillid
                    from ia_ijbill
                   where vbillcode = '81300IJ201905100666') for update 
--单据明细实体                   
select nnum, vbatchcode
  from ia_detailledger
 where vbillcode = '81300IJ201905100666' for update
                   
--调拨入库单
select billmaker, approver
  from ic_transin_h
 where vbillcode = '81300FR20190513061'
   and dr = 0
   for update  --1001D1100000000IW0NG
     
   --存货调拨入库单
   select creator, billmaker
     from ia_iibill
    where vbillcode = '81300II2019050664'
    and dr=0 for update 
                   
                   
                   
                   
                   
                   
                   
                   
