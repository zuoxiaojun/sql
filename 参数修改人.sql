select *
  from pub_sysinit
 where modifier = (select cuserid from sm_user where user_code = 'yy01') 
   --1001D1100000004ZGACH

select cuserid from sm_user where user_code = '172193'  --1001B11000000000ABX1

update pub_sysinit
   set modifier = '1001B11000000000ABX1'
 where modifier = '1001D1100000004ZGACH'
