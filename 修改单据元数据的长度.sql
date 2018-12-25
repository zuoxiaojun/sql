
--单据字段修改
alter table ct_sale modify vdef18 varchar2(500);

--实体属性 修改字段长度
select classid,name,displayname,attrlength from md_property where name='pk_payablebill' and displayname='应付单标识';
select name,displayname,attrlength  from md_property where classid = '6c8584f4-21d4-4ec9-9eac-96ad472acf2f';

--修改自定义项18的长度为500
update md_property set attrlength=500 where classid = '6c8584f4-21d4-4ec9-9eac-96ad472acf2f' and name='def18';

--MD_COLUMN 
select  name,displayname,columnlength from MD_COLUMN  where id =  'ap_payablebill@@@def18' ;

update MD_COLUMN set columnlength=500 where id ='ap_payablebill@@@def18'
