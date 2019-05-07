--查询出差旅报销单税码税率均为空的数据

select defitem24, defitem25, pk_jkbx, ts
  from er_busitem
 where defitem25 = '~' --0.00
   and defitem24 = '~' --1001Z01000000003W0X1
   and pk_jkbx in (select pk_jkbx from er_bxzb where djlxbm = '2641')
   and ts > '2019-01-01 00:00:00'
 
 /*  
 
 select defitem24, defitem25, pk_jkbx, ts
   from er_busitem
  where pk_jkbx =
        (select pk_jkbx from er_bxzb where djbh = '801000019050011') 
        
         */

update er_busitem a
   set a.defitem24 = '1001Z01000000003W0X1', a.defitem25 = '0.00'
 where a.pk_busitem in
       (select pk_busitem
          from er_busitem
         where defitem25 = '~'
           and defitem24 = '~'
           and pk_jkbx in
               (select pk_jkbx from er_bxzb where djlxbm = '2641')
           and ts > '2019-01-01 00:00:00');
           
           
  
