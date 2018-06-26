--修改采购订单来源单据

select  pk_ct_pu, bshowlatest,version   from ct_pu where vbillcode ='FAT/18-19/0093'  and dr =0  --1001D110000000ASYT6U

select cfirstid,csourceid,ccontractid,vcontractcode
  from po_order_b
 where pk_order in (select pk_order
                      from po_order
                     where vbillcode in ('83400CD20180615001',
                                         '83400CD20180621001',
                                         '83400CD20180621003')) for update 

