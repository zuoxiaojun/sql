

--查询修改采购发票购销类型错误的单据
select vbillcode  from po_invoice where fbuysellflag<>2

update po_invoice set fbuysellflag = 2 where fbuysellflag <> 2
