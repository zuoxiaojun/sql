select  * from so_saleinvoice_b where nnum='4985.99998' and dr=0;

update so_saleinvoice_b
   set nnum         = '4986.00000', --主数量
       nastnum      = '1645380.00000', --数量
       norigmny     = '506283.43', --无税金额
       norigtaxmny  = '506283.43', --价税合计
       nqtunitnum   = '1645380.00000', --报价数量
       ncaltaxmny   = '3341976.92', --计税金额
       nmny         = '3341976.92', --本币无税金额
       ntaxmny      = '3341976.92', --本币价税合计
       ngroupmny    = '3341976.92', --集团本币无税金额
       ngrouptaxmny = '3341976.92' --集团本币价税合计   
 where nnum = '4985.99998'
   and dr = 0;                                                       --发票表体
   
   
update so_saleinvoice
   set ntotalastnum  = '5079360', --总数量
       ntotalorigmny = '1560915.95'--价税合计
 where vbillcode = 'PAN INDIA-5MW' and dr=0   
