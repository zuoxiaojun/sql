/*生产订单未入库金额
  来源只取自制的生产订单和销售订单
  单价取自来源的销售订单表体含税单价*/

SELECT mm_dmo.vbillcode vbillcode,
       substr(mm_dmo.tplanendtime, 1, 10) tplanendtime,
       mm_dmo.ccustomerid ccustomerid,
       mm_dmo.cplannerid cplannerid,
       mm_dmo.vdef101 vdef101,
       nvl(mm_dmo.ninnum, 0) ninnum,
       mm_dmo.nnum nnum,
       mm_dmo.vdef6 vdef6,
       so_saleorder_b.nqtorigtaxprice nqtorigtaxprice,
       mm_dmo.pk_group pk_group,
       substr(mm_dmo.ddemandtime, 1, 10) ddemandtime,
       (mm_dmo.nnum - nvl(mm_dmo.ninnum, 0)) waitin,
       ((mm_dmo.nnum - nvl(mm_dmo.ninnum, 0)) *
       so_saleorder_b.nqtorigtaxprice) nnmoney
  FROM mm_dmo mm_dmo
  LEFT JOIN so_saleorder_b so_saleorder_b
    ON (mm_dmo.vfirstbid = so_saleorder_b.csaleorderbid)
 WHERE mm_dmo.dr = 0
   AND nvl(mm_dmo.ninnum, 0) <> mm_dmo.nnum
   AND mm_dmo.vsrctype <> '55B4'
