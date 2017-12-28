select distinct (item_code) from pam_alter_sheet; --变动项目

select pk_org, code, name
  from org_orgs --组织 
union all
select pk_priority, prior_code, prior_name
  from ewm_priority --工单优先级 
union all
select pk_dept, code, name
  from org_dept --部门
union all
select pk_location, location_code, location_name
  from pam_location
union all --位置
select pk_vid, code, name
  from org_dept_v --部门版本
union all
select pk_psndoc, code, name
  from bd_psndoc --人员
union all
select pk_status, status_code, status_name
  from pam_status --状态
union all
select pk_vid, code, name
  from org_orgs_v --组织版本
union all
select pk_defdoc, code, name
  from bd_defdoc --自定义档案
union all
select pk_category, category_code, category_name
  from pam_category --设备类别
union all
select pk_supplier, code, name
  from bd_supplier --供应商
