select  * from tyuser;

update sm_user set enablestate ='3' where user_code  in (select code from tyuser);--����NC�û���

update bd_psndoc set enablestate ='3' where code  in (select code from tyuser);--������Ա��

update cp_user set enablestate  ='3' where user_code  in (select code from tyuser);-- ����portal���û�
