--�޸����䵥����

--���䵥
select vdef20
  from dm_delivbill
 where vbillcode in ('81300YS20190430184') for update ;

select code,name , pk_dept  from org_dept where name='����������'  --1001D110000000F1TE16

--Ӧ���˷ѷ�Ʊ
select vdef20
  from dm_apinvoice
 where vbillcode = '81300WF201906120044'
   for update


update dm_delivbill
   set vdef20 = '1001D110000000F1TE16'
 where vbillcode in ('81300YS20190429168',
                     '81300YS20190429167',
                     '81300YS20190429171',
                     '81300YS20190429170',
                     '81300YS20190402027')
