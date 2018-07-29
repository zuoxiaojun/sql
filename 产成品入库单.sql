SELECT ic_finprodin_h.pk_group pk_group,
       substr(ic_finprodin_h.dbilldate, 1, 10) dbilldate,
       ic_finprodin_b.cmaterialvid cmaterialvid,
       ic_finprodin_b.nnum nnum,
       ic_finprodin_h.vbillcode vbillcode
  FROM ic_finprodin_h ic_finprodin_h
  LEFT JOIN ic_finprodin_b ic_finprodin_b
    ON (ic_finprodin_h.cgeneralhid = ic_finprodin_b.cgeneralhid)
 where ic_finprodin_h.dr = 0
   and ic_finprodin_b.dr = 0
