
     --�޸�ƾ֤ԭ�ҽ��
select creditamount, debitamount
  from gl_detail
 where nov = '5'  --ƾ֤��
   and detailindex = '1'  --�к�
   and explanation = '��Ʊ����CNOT/LQI2018,Ӧ��Sertus Incorporations Limited,, ��ͬ�ţ��¼��¹�˾��ַά��'
   for update
