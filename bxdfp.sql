create or replace view bxdfp as
select distinct (b.DEFITEM35)
  from er_bxzb a
  left join er_busitem b
    on a.pk_jkbx = b.pk_jkbx
 where a.djzt in ( '2', '3') --取报销单审核，签字状态的
;

select djbh,dr,djzt
  from er_bxzb
 where pk_jkbx in
       (select pk_jkbx from er_busitem where DEFITEM35 = '01203698')
