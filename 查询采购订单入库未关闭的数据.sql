
--查询采购订单入库未关闭的数据
select  a.vbillcode,a.pk_org,a. pk_dept_v ,b.
  from po_order a
  left join po_order_b b
    on a. pk_order = b. pk_order
 where a.ctrantypeid in
       (select pk_billtypeid
          from bd_billtype
         where pk_billtypecode in ('21-Cxx-01', '21-Cxx-02'))
   and b.bstockclose = 'N'
