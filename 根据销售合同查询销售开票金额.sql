
select csaleorderbid
  from so_saleorder_b
 where cctmanageid = (select pk_ct_sale
                        from ct_sale
                       where vbillcode = 'GCL/SI-XS/ZJ-201612160115-HR-1'
                         and dr = '0'
                         and blatest = 'Y')
   and dr = '0'  -- 查询合同下游生成销售订单的子表主键


select sum(ntaxmny)
  from so_saleinvoice_b
 where cfirstbid in
       (select csaleorderbid
          from so_saleorder_b
         where cctmanageid =
               (select pk_ct_sale
                  from ct_sale
                 where vbillcode = 'GCL/JC-HBQY-01-XS/BOS-2016032/01.'
                   and dr = '0'
                   and blatest = 'Y')
           and dr = '0')
    and dr =0  --根据销售合同查询销售开票金额
