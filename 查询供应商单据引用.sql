select pk_supplier from bd_supplier where code = '01004927' --1001D110000000DFZDQJ

--��ѯ��Ӧ�̵�������
select *
  from (select '�ɹ���ͬ', vbillcode, dr, cvendorid
          from ct_pu
        union all
        select '�ɹ�����', vbillcode, dr, pk_supplier
          from po_order
        union all
        select '���', billno, dr, supplier
          from ap_payitem
        union all
        select 'Ӧ����', billno, dr, supplier
          from ap_payableitem
        union all
        select '��������', vbillno, dr, pk_supplier
          from cmp_apply
        union all
        select '�ɹ���Ʊ', vbillcode, dr, pk_supplier
          from po_invoice     
        )
 where cvendorid = '1001D110000000DFZDQJ'
