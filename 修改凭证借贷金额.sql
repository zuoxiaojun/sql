
--�޸�ƾ֤������
select debitamount, --ԭ�ҽ跽���
       creditamount, --ԭ�Ҵ������   
       groupdebitamount, --���ű��ҽ跽���
       groupcreditamount, -- ���ű��Ҵ������  
       localdebitamount, --��֯���ҽ跽���  
       localcreditamount --��֯���Ҵ������ 
  from gl_detail
 where explanation = '����Ա��Ӧ���籣'
   and detailindex = 181
   and localcreditamount = 534600.91
   for update
