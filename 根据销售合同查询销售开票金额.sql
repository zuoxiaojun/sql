
select sum(ntaxmny) "本币价税合计", sum(norigtaxmny) "价税合计"
  from ct_sale_b
 where pk_ct_sale = (select pk_ct_sale
                       from ct_sale
                      where vbillcode = 'GCL/XMBU-XSSW-2017-0807号'
                        and blatest = 'Y')  --查询合同金额


select sum(ntaxmny)"本币价税合计" ,sum(norigtaxmny )"价税合计"
  from so_saleinvoice_b
 where cfirstbid in
       (select csaleorderbid
          from so_saleorder_b
         where cctmanageid =
               (select pk_ct_sale
                  from ct_sale
                 where vbillcode = 'GCL/XMBU-XSSW-2017-0807号'
                   and dr = '0'
                   and blatest = 'Y')
           and dr = '0')
    and dr =0  --根据销售合同查询销售开票金额
