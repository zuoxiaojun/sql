/*�����ɹ����������ۼƵ������ۼ��������*/
select nbackarrvnum, nbackstorenum, naccumarrvnum, --�ۼƵ���������
naccumstorenum,--�ۼ����������
naccuminvoicenum --�ۼƿ�Ʊ������
  from po_order_b
 where pk_order = (select pk_order
                     from po_order
                    where vbillcode = '81600CD20171123012'
                      and dr = 0
                      and bislatest = 'Y')
   for update
