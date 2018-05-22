--自制销售订单关联销售合同
select pk_ct_sale,ctrantypeid from ct_sale where vbillcode='GCL-XXJC-XSSW-2018-0336号'--1001D110000000AET9C2

select  nordnum,pk_ct_sale_b  from ct_sale_b where pk_ct_sale='1001D110000000AET9C2' for update --修改累计订单数量

select vctcode,
       cctmanageid,
       cctmanagebid,
       vsrctype,
       vsrctrantype,
       vsrccode,
       vsrcrowno,
       csrcid,
       csrcbid
  from so_saleorder_b
 where csaleorderid = (select csaleorderid
                         from so_saleorder
                        where vbillcode = '82500XD20180517048'
                          and dr = 0)    -- for update 修改销售订单表体来源单据信息
