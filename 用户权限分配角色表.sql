select cuserid
  from sm_user
 where user_code = '163322' --1001A110000000004TCV


--�û�Ȩ�޷����ɫ��
  select pk_role, pk_user_role, creationtime, creator
    from sm_user_role
   where creator = '1001D1100000004ZGACH'
   order by creationtime desc
   
  -- for update 

update sm_user_role
   set creator = '1001A110000000004TCV'
 where creator = '1001D1100000004ZGACH'
