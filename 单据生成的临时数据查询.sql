
--单据生成的临时数据查询
select *
--src_relationid, operateflag, des_relationid, dr
  from fip_operatinglog
 where src_org = (select pk_org from org_orgs where code = '834') 
 
 delete from fip_operatinglog where src_org = (select pk_org from org_orgs where code = '834') 
