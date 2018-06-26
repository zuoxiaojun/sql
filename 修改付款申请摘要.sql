--ĞŞ¸Ä¸¶¿îÉêÇëÕªÒª
select SUMMARY
  from cmp_apply_b
 where   pk_apply  =
       (select   pk_apply  from cmp_apply where vbillno = 'SS18061984') for update   
