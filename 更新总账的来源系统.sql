--�������˵���Դϵͳ
select pk_system
  from gl_voucher
 where explanation = '��,����Э�μ��ɿƼ����޹�˾����'
   and year = '2019'
   and period = 5
   and totaldebit = 29796800.00
   for update 


select distinct(pk_system) from gl_voucher
