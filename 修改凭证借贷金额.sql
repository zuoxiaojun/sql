
--�޸�ƾ֤������
select debitamount, --ԭ�ҽ跽���
       creditamount, --ԭ�Ҵ������   
       groupdebitamount, --���ű��ҽ跽���
       groupcreditamount, -- ���ű��Ҵ������  
       localdebitamount, --��֯���ҽ跽���  
       localcreditamount --��֯���Ҵ������ 
  from gl_detail
 where explanation = '����1-9#'
   and detailindex = 2
   --and groupdebitamount = 3240.12
   for update
