
--�����ֶ��޸�
alter table ct_sale modify vdef18 varchar2(500);

--ʵ������ �޸��ֶγ���
select classid,name,displayname,attrlength from md_property where name='pk_payablebill' and displayname='Ӧ������ʶ';
select name,displayname,attrlength  from md_property where classid = '6c8584f4-21d4-4ec9-9eac-96ad472acf2f';

--�޸��Զ�����18�ĳ���Ϊ500
update md_property set attrlength=500 where classid = '6c8584f4-21d4-4ec9-9eac-96ad472acf2f' and name='def18';

--MD_COLUMN 
select  name,displayname,columnlength from MD_COLUMN  where id =  'ap_payablebill@@@def18' ;

update MD_COLUMN set columnlength=500 where id ='ap_payablebill@@@def18'
