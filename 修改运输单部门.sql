--�޸����䵥����

--���䵥
select vdef20
  from dm_delivbill
 where vbillcode in ('81600YS20190430048') for update ;

select code,name , pk_dept  from org_dept where name='�ƻ�����-�ƻ�'  --1001D1100000000MT85Q

--Ӧ���˷ѷ�Ʊ
select vdef20
  from dm_apinvoice
 where vbillcode = '81600WF201904120046'
   for update


