--�û�״̬���ѯ
select *
  from sm_user_ex
 where user_id = (select cuserid from sm_user where user_code = '222680') 
--ɾ���˱����ݼ�����ʾ��������

select count(*)  from sm_user_ex
select count(*)  from sm_user

delete from sm_user_ex
 where user_id = (select cuserid from sm_user where user_code = '226680')
 
 create table sm_user_ex_bak  as  select * from sm_user_ex
 
 select * from sm_user_ex_bak
