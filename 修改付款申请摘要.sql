--ĞŞ¸Ä¸¶¿îÉêÇë
select olcapplymny
  from cmp_apply_b
 where   pk_apply  =
       (select   pk_apply  from cmp_apply where vbillno = 'SS18070120') for update   
