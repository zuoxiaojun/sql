select  * from tyuser;

update sm_user set enablestate ='3' where user_code  in (select code from tyuser);--更新NC用户表

update bd_psndoc set enablestate ='3' where code  in (select code from tyuser);--更新人员表

update cp_user set enablestate  ='3' where user_code  in (select code from tyuser);-- 更新portal端用户
