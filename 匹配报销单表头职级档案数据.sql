
--匹配报销单表头职级档案数据
select djbh,jkbxr,zyx30 from er_bxzb  where zyx30 = '~' order by ts desc

select * from EHR_SYNONYMS_CUX_HR2ZJ_TM where psncode='111288' for update

--查询出人员职级数据
create or replace view v_info_ryzj as 
select  a.pk_psndoc, a.code, a.name,b.*
  from bd_psndoc a
  left join EHR_SYNONYMS_CUX_HR2ZJ_TM b
    on a.code = b.psncode


select * from v_info_ryzj;

--更新报销单表头职级数据
merge into er_bxzb a
using v_info_ryzj b
on (a.jkbxr = b.pk_psndoc)
when matched then
  update set a.zyx30 = b.zj where a.zyx30 = '~'


--创建存储过程

create or replace procedure update_zj is
begin
  merge into er_bxzb a
  using v_info_ryzj b
  on (a.jkbxr = b.pk_psndoc)
  when matched then
    update set a.zyx30 = b.zj where a.zyx30 = '~';
  commit;
end;


select * from user_jobs
