
--��ѯ�ɹ���ͬ��Ӧ�������ɵĲɹ���Ʊ���ϼ�
select sum(ngrouptaxmny)
  from po_invoice_b
 where cfirstbid in
       (select b.pk_order_b
          from po_order a
          left join po_order_b b
            on a.pk_order = b.pk_order
         where a.dr = 0
           and b.dr = 0
           and a.bislatest = 'Y'  --�ɹ��������°汾
           and ccontractid = (select pk_ct_pu
                                from ct_pu
                               where vbillcode = 'GCL/JZJC-CG/YFL-2017-172-��02'
                                 and dr = 0
                                 and blatest = 'Y'))



