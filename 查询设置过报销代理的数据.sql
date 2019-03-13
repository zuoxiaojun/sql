select distinct (pk_roler ) from er_indauthorize
--查询设置过报销代理的数据
select role_name
  from sm_role
 where pk_role in (select distinct (pk_roler) from er_indauthorize)
 
 
