
     --�޸�ƾ֤ԭ�ҽ��
select creditamount, debitamount
  from gl_detail
 where nov = '200'
   and detailindex = '22'
   and explanation = '֧��3��ְ������'
   for update
