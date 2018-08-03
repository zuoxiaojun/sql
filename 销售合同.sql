select fstatusflag ,actualvalidate  from ct_sale where vbillcode ='20180801-2' for update

select *
  from ct_sale_b
 where pk_ct_sale =
       (select pk_ct_sale from ct_sale where vbillcode = 'AD-GCL-2016-10-12-”¶ ’≤π56') --for update
