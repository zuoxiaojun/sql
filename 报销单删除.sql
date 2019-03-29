--±¨Ïúµ¥É¾³ý

select  pk_jkbx ,dr from er_bxzb where djbh='80100BX19030043' for update 

select dr from er_busitem where pk_jkbx='0001D1100000009V09GB' for update 


select dr, pk_settlement
  from cmp_settlement
 where billcode = '80100BX19030043'
   for update --0001D1100000009V09GD
 
 select dr from cmp_detail where pk_settlement = '0001D1100000009V09GD'for update 
