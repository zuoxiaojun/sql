
--�޸�ƾ֤������
select debitamount, --ԭ�ҽ跽���
       creditamount, --ԭ�Ҵ������   
       groupdebitamount, --���ű��ҽ跽���
       groupcreditamount, -- ���ű��Ҵ������  
       localdebitamount, --��֯���ҽ跽���  
       localcreditamount --��֯���Ҵ������ 
  from gl_detail
 where explanation = 'Ԥ��1�·������ִ���'
   and detailindex = 2
   --and creditamount = 4413.7
   for update
