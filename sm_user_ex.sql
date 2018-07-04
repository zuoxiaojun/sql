--用户状态表查询
select *
  from sm_user_ex
 where user_id = (select cuserid from sm_user where user_code = '222680') 
--删除此表数据即不提示密码重置

select count(*)  from sm_user_ex
select count(*)  from sm_user

delete from sm_user_ex
 where user_id = (select cuserid from sm_user where user_code = '226680')
 
 create table sm_user_ex_bak  as  select * from sm_user_ex
 
 select * from sm_user_ex_bak
