
--�������ɵ���ʱ���ݲ�ѯ
select *
--src_relationid, operateflag, des_relationid, dr
  from fip_operatinglog
 where src_org in (select pk_org from org_orgs where code = '833') 
 
 delete from fip_operatinglog where src_org in (select pk_org from org_orgs where code = '833') 
