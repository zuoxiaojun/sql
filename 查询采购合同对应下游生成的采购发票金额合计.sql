
--��ѯ�ɹ���ͬ��Ӧ�������ɵĲɹ���Ʊ���ϼ�
select sum(ngrouptaxmny) 
  from po_invoice_b
 where cfirstbid in
       (select pk_order_b
          from po_order_b
         where csourceid = (select pk_ct_pu
                              from ct_pu
                             where vbillcode = 'GCL/XXJC-QT-2017-087'
                               and dr = 0
                               and blatest = 'Y')
           and dr = 0)    ----��Ʊ���ϼ�
