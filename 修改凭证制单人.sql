
select cuserid  from sm_user where   user_code ='yy01'
select cuserid  from sm_user where   user_code ='228148' --1001D110000000C6RR81
select name  from org_accountingbook where pk_accountingbook ='1001D1100000000NCC8L'
--修改凭证制单人
select creator,
       pk_prepared,
       pk_checked,
       dr,
       num,
       year,
       period,
       pk_accountingbook
  from gl_voucher
 where pk_prepared = '1001D1100000004ZGACH'
   for update 
