/*
�ڲ������嵥ת������ʾ�ɱ�����Ϊ�գ�
ԭ��to_presettlein_bb ����ɱ����ֶ�cdowncostregionidΪ��
�Ʋ����¼Ӳֿ��û�аѸòֿ�ӵ��ɱ�����
������ɱ����ֶβ��Ϻ󣬳ɱ�����Ӳֿ⼴��
*/


select  pk_costregion  from  org_costregion where code='801' --1001D1100000000QYRNK
 

--��������뵥����ʵ��

select cupcostregionid, --���γɱ���
       cdowncostregionid --���γɱ���      
  from to_presettlein_bb
 where cbillid in (select cbillid
                     from to_presettlein
                    where vsrccode = '80100FR20190514001') for update 
                           
 --���������������ʵ��
 
select cupcostregionid, cdowncostregionid
  from to_presettleout_bb
 where cbillid in (select cbillid
                     from to_presettleout
                    where vsrccode = '80100FR20190514001')
   for update --1001D1100000000QYRNK
 
 
 
 
 
