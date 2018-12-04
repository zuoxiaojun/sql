--修改销售合同价税合计
select norigtaxmny
  from ct_sale_b
 where pk_ct_sale =
       (select pk_ct_sale
          from ct_sale
         where vbillcode = 'GCL/XXJC-XSSW(D)-2018-0087'
         and blatest='Y')
for update   --2356200.00000000
