--�޸����䵥����
--Ӧ���˷ѷ�Ʊ
select vdef20
  from dm_apinvoice
 where vbillcode = '81300WF201906060032'
 
 
--���䵥  

select vdef20
  from dm_delivbill
 where vbillcode in ('81200YS20190521058') for update ;


--����pk
select code,name , pk_dept  from org_dept where name='�ձ�'  --1001D110000000FJGZAC

update dm_delivbill
   set vdef20 = '1001D110000000F1TE16'
 where vbillcode in ('81300YS20190429168',
                     '81300YS20190429167',
                     '81300YS20190429171',
                     '81300YS20190429170',
                     '81300YS20190402027')
