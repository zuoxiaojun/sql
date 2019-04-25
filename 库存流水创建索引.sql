
--库存流水创建索引  vbillcode
create index in_ic_flow_his on ic_flowaccount_his(vbillcode)


select index_name, index_type, table_name
  from user_indexes
 where table_name = (select upper('ic_flowaccount_his') from dual)
