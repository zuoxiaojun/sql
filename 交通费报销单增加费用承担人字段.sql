
--交通费报销单增加费用承担人字段

select distinct(zyx5) from er_bxzb;
select distinct(zyx6) from er_bxzb;
select distinct(zyx7) from er_bxzb


--更新历史单据费用承担人为收款人
update er_bxzb set zyx6 = receiver, zyx7 = fydeptid where zyx6 = '~'


--更新历史单据费用承担人职级
merge into er_bxzb a
using v_info_ryzj b
on (a.zyx6 = b.pk_psndoc)
when matched then
  update set a.zyx5 = b.zj where a.zyx5 = '~'

