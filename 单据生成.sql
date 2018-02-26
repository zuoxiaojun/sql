
/*单据生成后台对应表*/

select *  from fip_operatinglog where src_org  ='0001D11000000007EITA'--处理状态

select code,name, pk_org  from org_orgs where code='802'

delete from fip_operatinglog where SRC_FREEDEF1='80207FK17020081'
