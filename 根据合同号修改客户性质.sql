--���ݺ�ͬ���޸Ŀͻ�����

/*��ѯ�ͻ�����*/
select code, name, pk_defdoc
  from bd_defdoc
 where pk_defdoclist =
       (select pk_defdoclist from bd_defdoclist where name = '�ͻ�����')

/*���п�����ȫ���޸�Ϊ�ص�ͻ�*/

update ct_sale
   set vdef4 = '1001D1100000009IN33I'
 where vdef4 = '1001D1100000009IN33D'


/*���պ�ͬ�Ÿ���*/

create table htxz (
vbillcode varchar(40),
vdef4  varchar(101) 
)

select * from htxz

truncate table htxz

update ct_sale a
   set a.vdef4 =
       (select b.vdef4 from htxz b where a.vbillcode = b.vbillcode)
 where exists (select * from htxz b where a.vbillcode = b.vbillcode)
 and blatest ='Y'



select vdef4
  from ct_sale
 where vbillcode = 'GCL/XXJC-XS-2018-0057'  --1001D1100000009IN33B
   and blatest = 'Y'
   for update


--���º�ͬ�ͻ�����Ϊ˫����  1001D1100000009IN33H

update ct_sale
   set vdef4 = '1001D1100000009IN33H'
 where vbillcode in ('GCL/DSWF-QT-20180090��',
                     'GCL/DSWF-QT-20180104��',
                     'GCL/DSWF-QT-20190025��',
                     'GCL/ZJGJC-QT-20180068',
                     'GCL/ZJGJC-QT-20180095',
                     'GCL/ZJGJC-XSSW-20180019',
                     'CHYN-GCL201805-1')















