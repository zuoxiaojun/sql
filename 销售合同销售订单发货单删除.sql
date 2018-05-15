select dr, cdeliveryid from so_delivery where vbillcode='00813DN20180510006' for update

select dr from so_delivery_b where cdeliveryid='1001D110000000ADKFRH' for update
--发货单


select dr, csaleorderid
  from so_saleorder
 where vbillcode = '80100XD20180509044' for update 
 
 select dr from so_saleorder_b where csaleorderid='1001D110000000ADD4SS' for update
 --销售订单
 
 
 select dr,pk_ct_sale,subscribedate from ct_sale where vbillcode='GCL/XXJC-1MWXS-2018-0052' for update
update ct_sale_b
   set dr = 1
 where pk_ct_sale in
       (select pk_ct_sale
          from ct_sale
         where vbillcode = 'GCL/XXJC-1MWXS-2018-0052') --销售合同
