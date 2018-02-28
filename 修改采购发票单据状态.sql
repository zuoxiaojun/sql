
/*修改采购发票单据状态*/

select fbillstatus  from po_invoice where VBillcode='81900CF201801090002' ;

update po_invoice set fbillstatus=3 where VBillcode='81900CF201801150001'--修改为审批通过态
