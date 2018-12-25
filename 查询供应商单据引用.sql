select pk_supplier from bd_supplier where code = '01004927' --1001D110000000DFZDQJ

--查询供应商单据引用
select *
  from (select '采购合同', vbillcode, dr, cvendorid
          from ct_pu
        union all
        select '采购订单', vbillcode, dr, pk_supplier
          from po_order
        union all
        select '付款单', billno, dr, supplier
          from ap_payitem
        union all
        select '应付单', billno, dr, supplier
          from ap_payableitem
        union all
        select '付款申请', vbillno, dr, pk_supplier
          from cmp_apply
        union all
        select '采购发票', vbillcode, dr, pk_supplier
          from po_invoice     
        )
 where cvendorid = '1001D110000000DFZDQJ'
