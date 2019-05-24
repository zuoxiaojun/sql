select *
  from gl_detail gl_detail, gl_docfree1
 where gl_detail.yearv = '2019'
   and gl_detail.adjustperiod >= '01'
   and gl_detail.adjustperiod <= '05'
   and gl_detail.assid = gl_docfree1.assid
   and gl_detail.pk_accountingbook = '1001D1100000000H4HJM'
   and gl_detail.discardflagv <> 'Y'
   and gl_detail.dr = 0
   and gl_detail.voucherkindv <> 2
   and gl_detail.voucherkindv <> 255
   and gl_detail.voucherkindv <> 4
   and gl_detail.voucherkindv <> 5
   and gl_detail.pk_accasoa = '1001A110000000000GGO'
   and gl_docfree1.F4 = '0001D110000000077KXL'
   and 1 = 1

select * from gl_docfree1 where assid in ('1001D1100000000UDFSF','1001D1100000009OAX6L','')

select * from gl_freevalue where freevalueid in ('1001D1100000000UDFSF','1001D1100000009OAX6L','')


create table gl_detail_bak_20190522 as
select * from gl_detail where assid = '1001D1100000000UDFSF'

create table gl_detail_bak_2019052202 as
select * from gl_detail where assid = '1001D1100000009OAX6L'

update gl_detail set assid = '1001D1100000009OAX6L' where pk_detail in (
select pk_detail from gl_detail_bak_20190522
)


commit
