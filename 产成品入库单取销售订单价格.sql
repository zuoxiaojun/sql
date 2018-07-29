SELECT ic_finprodin_h.pk_group pk_group,
       ic_finprodin_h.vbillcode vbillcode,
       substr(ic_finprodin_h.dbilldate, 1, 10) dbilldate,
       ic_finprodin_b.cmaterialvid cmaterialvid,
       ic_finprodin_b.nnum nnum,
       mm_dmo001.nqtorigtaxprice nqtorigtaxprice
  FROM ic_finprodin_h ic_finprodin_h
  LEFT JOIN ic_finprodin_b ic_finprodin_b
    ON (ic_finprodin_h.cgeneralhid = ic_finprodin_b.cgeneralhid)
  LEFT JOIN (SELECT mm_dmo.pk_group                pk_group,
                    mm_dmo.pk_dmo                  pk_dmo,
                    mm_dmo.cmaterialvid            cmaterialvid,
                    mm_dmo.vbillcode               vbillcode,
                    so_saleorder_b.nqtorigtaxprice nqtorigtaxprice
               FROM mm_dmo mm_dmo
               LEFT JOIN so_saleorder_b so_saleorder_b
                 ON (mm_dmo.vsrcbid = so_saleorder_b.csaleorderbid)
              WHERE mm_dmo.dr = 0) mm_dmo001
    ON (ic_finprodin_b.cfirstbillhid = mm_dmo001.pk_dmo)
 WHERE ic_finprodin_h.dr = 0
   AND ic_finprodin_b.dr = 0
