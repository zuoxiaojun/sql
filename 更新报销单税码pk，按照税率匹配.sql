select distinct(djlxbm)  from er_bxzb 

--差旅费报销单（查询出税率有值，税码字段为空的数据）
select defitem24, defitem25, pk_jkbx, ts
  from er_busitem
 where defitem25 in ('10.00',
                     '6.00',
                     '5.00',
                     '9.00',
                     '8.00',
                     '16.00',
                     '21.00',
                     '7.70',
                     '17.00',
                     '13.00',
                     '0.00',
                     '11.00',
                     '19.00',
                     '7.00',
                     '3.00')
   and defitem24 = '~'
   and pk_jkbx in (select pk_jkbx from er_bxzb where djlxbm = '2641')
   and ts > '2019-01-01 00:00:00'

select djbh from er_bxzb where pk_jkbx='0001D11000000025RQZM'

--交通费报销单，交通住宿，通用费用，（查询出税率有值，税码字段为空的数据）
select defitem20, defitem21, pk_jkbx, ts
  from er_busitem
 where defitem21 in ('10.00',
                     '6.00',
                     '5.00',
                     '9.00',
                     '8.00',
                     '16.00',
                     '21.00',
                     '7.70',
                     '17.00',
                     '13.00',
                     '0.00',
                     '11.00',
                     '19.00',
                     '7.00',
                     '3.00')
   and defitem20 = '~'
   and pk_jkbx in
       (select pk_jkbx
          from er_bxzb
         where djlxbm in ('264X-Cxx-002', '264X-Cxx-001', '2642'))
   and ts > '2019-01-01 00:00:00'
   
   --增值税税码税率
   select a.pk_taxcode, a.code, b.taxrate
     from bd_taxcode a
     left join bd_taxrate b
       on a. pk_taxcode = b. pk_taxcode
    where a.code like 'CN%'

--创建税码税码税率对照表
create table t_smsl as (select a.pk_taxcode, a.code, b.taxrate
     from bd_taxcode a
     left join bd_taxrate b
       on a. pk_taxcode = b. pk_taxcode
    where a.code like 'CN%')
    
    
    select * from t_smsl  order by taxrate for update

/*更新报销单税码pk，按照税率匹配  */

--差旅费报销单
update er_busitem a
   set a.defitem24 =
       (select b.pk_taxcode from t_smsl b where a.defitem25 = b.taxrate)
 where exists (select 1
          from t_smsl b
         where to_number(a.defitem25) = to_number(b.taxrate))
   and a.pk_busitem in
       (select pk_busitem
          from er_busitem
         where defitem25 in ('10.00',
                             '6.00',
                             '5.00',
                             '9.00',
                             '8.00',
                             '16.00',
                             '21.00',
                             '7.70',
                             '17.00',
                             '13.00',
                             '0.00',
                             '11.00',
                             '19.00',
                             '7.00',
                             '3.00')
           and defitem24 = '~'
           and pk_jkbx in
               (select pk_jkbx from er_bxzb where djlxbm = '2641')
           and ts > '2018-01-01 00:00:00');
           
           
--剩余报销单
update er_busitem a
   set a.defitem20 =
       (select b.pk_taxcode from t_smsl b where a.defitem21 = b.taxrate)
 where exists
 (select 1
          from t_smsl b
         where to_number(a.defitem21) = to_number(b.taxrate))
   and a.pk_busitem in
       (select pk_busitem
          from er_busitem
         where defitem21 in ('10.00',
                             '6.00',
                             '5.00',
                             '9.00',
                             '8.00',
                             '16.00',
                             '21.00',
                             '7.70',
                             '17.00',
                             '13.00',
                             '0.00',
                             '11.00',
                             '19.00',
                             '7.00',
                             '3.00')
           and defitem20 = '~'
           and pk_jkbx in
               (select pk_jkbx
                  from er_bxzb
                 where djlxbm in ('264X-Cxx-002', '264X-Cxx-001', '2642'))
           and ts > '2019-01-01 00:00:00')
           
           
   --创建存储过程，后台调度作业，定时执行  
 
 create or replace procedure update_er_busitem_tax
 --更新报销单税码pk，按照税率匹配
  is
 begin
   --差旅费报销单
  update er_busitem a
   set a.defitem24 =
       (select b.pk_taxcode from t_smsl b where a.defitem25 = b.taxrate)
 where exists (select 1
          from t_smsl b
         where to_number(a.defitem25) = to_number(b.taxrate))
   and a.pk_busitem in
       (select pk_busitem
          from er_busitem
         where defitem25 in ('10.00',
                             '6.00',
                             '5.00',
                             '9.00',
                             '8.00',
                             '16.00',
                             '21.00',
                             '7.70',
                             '17.00',
                             '13.00',
                             '0.00',
                             '11.00',
                             '19.00',
                             '7.00',
                             '3.00')
           and defitem24 = '~'
           and pk_jkbx in
               (select pk_jkbx from er_bxzb where djlxbm = '2641')
           and ts > '2018-01-01 00:00:00');
 
   --剩余报销单
  update er_busitem a
   set a.defitem20 =
       (select b.pk_taxcode from t_smsl b where a.defitem21 = b.taxrate)
 where exists
 (select 1
          from t_smsl b
         where to_number(a.defitem21) = to_number(b.taxrate))
   and a.pk_busitem in
       (select pk_busitem
          from er_busitem
         where defitem21 in ('10.00',
                             '6.00',
                             '5.00',
                             '9.00',
                             '8.00',
                             '16.00',
                             '21.00',
                             '7.70',
                             '17.00',
                             '13.00',
                             '0.00',
                             '11.00',
                             '19.00',
                             '7.00',
                             '3.00')
           and defitem20 = '~'
           and pk_jkbx in
               (select pk_jkbx
                  from er_bxzb
                 where djlxbm in ('264X-Cxx-002', '264X-Cxx-001', '2642'))
           and ts > '2019-01-01 00:00:00');
 
   commit;
 end;
  
  
         
           



