
--�޸�ƾ֤���
select detailindex,
       debitamount, --ԭ�ҽ跽���
       creditamount, --ԭ�Ҵ������
       -- globaldebitamount, --ȫ�ֱ��ҽ跽��� 
       --  globalcreditamount, --ȫ�ֱ��Ҵ������ 
       groupdebitamount, --���ű��ҽ跽���
       groupcreditamount, --���ű��Ҵ������
       localcreditamount, --��֯���Ҵ������
       localdebitamount --��֯���ҽ跽���
  from gl_detail
 where nov = '25' --ƾ֤��
  -- and detailindex = '1' --�к�
   and explanation = '��2018��9��Ԥ�����������ִ���'
   for update

select totaldebit,--�跽�ϼ� 
       totaldebitglobal,--ȫ�ֽ跽�ϼ� 
       totaldebitgroup,--���Ž跽�ϼ�
       totalcredit,--�����ϼ�
       totalcreditglobal,--ȫ�ִ����ϼ�
       totalcreditgroup --���Ŵ����ϼ�
  from gl_voucher
 where explanation = '��2018��9��Ԥ�����������ִ���'
 for update 
