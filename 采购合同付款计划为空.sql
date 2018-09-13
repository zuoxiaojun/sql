
--采购合同付款计划为空
select dr
  from ct_payplan
 where pk_ct_pu = (select pk_ct_pu
                     from ct_pu
                    where vbillcode = 'GCL/XXJC-CG-ZLBB-201804'
                      and blatest = 'Y') for update 
