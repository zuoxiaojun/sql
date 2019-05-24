--批量修改运输单部门
select vdef20, vbillcode
  from dm_apinvoice
 where fstatusflag in (1)
   and dr = 0;

select vdef20
  from dm_delivbill
 where vbillcode in ('48122018082900000144'
                     )
   for update;


create table ysdpp (

fpcode varchar2(255),
yscode varchar2(255),
dep    varchar2(255)
)


select * from  ysdpp;

truncate table ysdpp

merge into dm_delivbill a
using ysdpp b
on (a.vbillcode = b.yscode)
when matched then
  update set a.vdef20 = b.dep








