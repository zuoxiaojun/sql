--历史数据执行：
--先查一下有无错误数据规则
select * from bd_assign_rule where pk_assign_temp not in (select pk_assign_temp from bd_assign_temp )
--备份一下要删除的数据，防止出错
create table bd_assign_rule_copy as(select * from bd_assign_rule);
--删除错误数据
delete from bd_assign_rule where pk_assign_temp not in (select pk_assign_temp from bd_assign_temp );
