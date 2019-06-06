--销售合同关联销售订单，销售出库
select *
  from ct_sale a
  left join ct_sale_b b
    on a.pk_ct_sale = b.pk_ct_sale
  left join so_saleorder_b c
    on b.pk_ct_sale_b = c.cctmanagebid
  left join so_saleorder d
    on c.csaleorderid = d.csaleorderid
  left join ic_saleout_b e
    on c.csaleorderbid = e.cfirstbillbid
  left join ic_saleout_h f
    on e.cgeneralhid = f.cgeneralhid
 where a.blatest = 'Y'
   and nvl(a.dr, 0) = 0
   and nvl(b.dr, 0) = 0
   and nvl(c.dr, 0) = 0
   and nvl(d.dr, 0) = 0
   and nvl(e.dr, 0) = 0
   and nvl(f.dr, 0) = 0
   and f.vbillcode = '81600XC20190530192'
   
   
