
/*�޸�ƾ֤��������ֵ*/

--select pk_cust_sup, code, name from bd_cust_supplier

select assid, f4,dr --���������F4��ʾ���̸���
  from gl_docfree1
 where assid in (select assid --1001ZZ10000000000PH0
                   from gl_detail
                  where explanation = '1' --ժҪ
                    and detailindex = 2)  --��¼��
   for update
   
   
--������Ŀֵ��ƾ֤��������ʾֵ��

select freevalueid,typevalue1 
  from gl_freevalue
 where freevalueid = '1001ZZ10000000000PH0'
   for update

