--�޸Ŀ��������ˮ���Ƶ���

select dr,vbillcode  
  from ic_flow
 where billmaker = (select cuserid from sm_user where user_code = 'yy01')


select dr, vbillcode
  from ic_flowaccount_his
 where billmaker = (select cuserid from sm_user where user_code = 'yy01')


select cuserid from sm_user where user_name = 'κ����'  --1001D11000000014S9MJ

select vbillcode
  from ic_flowaccount_his
 where billmaker = (select cuserid from sm_user where user_code = 'yy01')
   and vbillcode like '80501%'


update ic_flow
   set billmaker = '1001D11000000014S9MJ'
 where billmaker = (select cuserid from sm_user where user_code = 'yy01')
   and vbillcode = '80100TC20180102002'


update ic_flowaccount_his
   set billmaker = '1001D11000000014S9MJ'
 where billmaker = (select cuserid from sm_user where user_code = 'yy01')
   and vbillcode = '80100TC20180102001'
 
