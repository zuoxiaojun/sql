
--���䵥����
select cdelivbill_hid, vdef20
  from dm_delivbill
 where vbillcode = '81300YS20190102033' for update  --0001D1100000001D9XCM


--���䵥�ӱ�
select cfirstid  from dm_delivbill_b where cdelivbill_hid='1001D110000000EIIMEG'


select csaleorderid,cdeptid 
  from so_saleorder
 where vbillcode = '81800XD20181228001'  --1001D110000000EBHUCZ


--�������䵥����vdef20�����ţ��ֶ�Ϊ���۶�������

--�Ƚ����۶������ŵ�ֵ���µ����䵥�ӱ���

select distinct(vbdef10) from dm_delivbill_b

merge into dm_delivbill_b a
using so_saleorder b
on (a.cfirstid = b.csaleorderid)
when matched then
  update set a.vbdef10 = b.cdeptid;
  
--�����䵥�ӱ�vbdef10���µ����䵥����vdef20��
create table yunshu as (
  select distinct (vbdef10), cdelivbill_hid
    from dm_delivbill_b
   where vbdef10 <> '~'
     and dr = 0 )--���䵥�ӱ���ֵ
     
     --����excelȥ�غ���yunshu��

merge into dm_delivbill a
using yunshu b
on (a.cdelivbill_hid = b.cdelivbill_hid)
when matched then
  update set a.vdef20 = b.vbdef10
  
  
 select * from yunshu;
 
 
