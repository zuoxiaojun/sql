--维度管理成员数据
select value_code, value_remark, f_code, f_remark, value_set_id
  from sys_flex_value_sets_custom
 where value_set_id = (select id
                         from sys_flex_value_sets
                        where flex_value_set_name = '销售组织')
