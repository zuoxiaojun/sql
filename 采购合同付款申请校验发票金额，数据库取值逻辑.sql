/*�ɹ���ͬ��������У�鷢Ʊ�����ݿ�ȡֵ�߼�  */

     select pk_ct_pu
          from ct_pu
         where vbillcode = 'GCL/FNJC-CG-2016-0207' and blatest ='Y';  --1001D1100000000S6ENN          ��ͬ����


select sum(ntaxmny)
  from po_invoice_b
 where cfirstid in (select pk_order
                      from po_order
                     where vbillcode in ('41501CD20170102002',
                                         '41501CD20161222001',
                                         '41501CD20160919007')
                       and dr = 0)
   and dr = 0l;
       
       select vsourcecode, csourceid
         from po_order_b
        where pk_order in
              (select pk_order
                 from po_order
                where vbillcode in ('41501CD20170102002',
               '41501CD20161222001','41501CD20160919007')) for update; --41501CD20161222001  �ɹ�������Դ����



select ccontractid
  from po_order_b
 where pk_order in (select pk_order
                      from po_order
                     where vbillcode in ('41501CD20170102002',
                                         '41501CD20161222001',
                                         '41501CD20160919007'))   --��ͬ����    1001D1100000000S6ENN
   --for update                                           --�ɹ����������ͬ������������Ҫȡֵ�ֶΣ�



select sum(ntaxmny)
  from po_invoice_b
 where cfirstid in
       (select pk_order
          from po_order_b
         where ccontractid in (select pk_ct_pu
                                 from ct_pu
                                where vbillcode = 'GCL/DSWF-QT-20170091��'
                                  and blatest = 'Y')
           and dr = 0)
   and dr = 0 --ȡ��ͬ��Ӧ�ķ�Ʊ�ܽ��




