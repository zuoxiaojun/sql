/*
�ڲ������嵥ת������ʾ�ɱ�����Ϊ�գ�
ԭ��to_presettlein_bb ����ɱ����ֶ�cincostregionidΪ��
�Ʋ����¼Ӳֿ��û�аѸòֿ�ӵ��ɱ�����
������ɱ����ֶβ��Ϻ󣬳ɱ�����Ӳֿ⼴��
*/
select cgeneralhid
  from ic_transout_h
 where vbillcode = '80200DC20190416001'


--�����������
select coutcostregionid, --�����ɱ���
cincostregionid --����ɱ���
  from to_presettleout
 where csrcid = '1001D110000000GUBNBH'

--��������뵥

select cgeneralhid  from ic_transin_h where vbillcode ='80100FR20190416001' --1001D110000000GUBNCQ
select cgeneralhid  from ic_transin_h where vbillcode ='80100FR20190416002' --1001D110000000GUBND1

select  pk_costregion  from  org_costregion where code='801' --1001D1100000000QYRNK

select cbillid,
       coutcostregionid, --�����ɱ���
       cincostregionid, ----����ɱ���
       cinstordocid --����ֿ�
  from to_presettlein
 where csrcid in ('1001D110000000GUBNCQ', '1001D110000000GUBND1')
for update 
  
 
--��������뵥����ʵ��
select cupcostregionid, --���γɱ���
       cdowncostregionid --���γɱ���
  from to_presettlein_bb
 where cbillid in ('1001D110000000GUBNDW', '1001D110000000GUBNE1')
   for update
