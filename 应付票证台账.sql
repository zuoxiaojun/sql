
 select distinct(pk_billtypecode) from fbm_register --��������
/*
1	36H2  Ӧ��Ʊ��
2	36H1  Ӧ��Ʊ��
*/

create or replace  view v_yfpj  as  (
select decode(baseinfostatus,
              'on_invoice',
              '�ڿ�Ʊ',
              'has_invoice',
              '�ѿ�Ʊ',
              'on_pay',
              '�ڸ���',
              'has_pay',
              '�Ѹ���',
              'on_paybill',
              '�ڸ�Ʊ',
              'has_paybill',
              '�Ѹ�Ʊ') baseinfostatus, --Ʊ��״̬   
       pk_group, --����   
       pk_org, --������
       fbmbilltype, --Ʊ������
       decode(impawnmode,
              'CREDIT',
              '����',
              'ASSURE',
              '��֤',
              'BAIL',
              '��֤��',
              'PLEDGE',
              '��Ѻ',
              'IMPAWN',
              '��Ѻ',
              'MIXED',
              '���') impawnmode, --Ʊ����Դ
       fbmbillno, --Ʊ��
       olcmoney, --���
       substr(invoicedate,1,10) invoicedate, --��Ʊ��
       substr(enddate,1,10) enddate, --������
       paybank, --��Ʊ��
       securityrate, --��֤�����
       securitymoney ,--��֤����
       usedccamount, --"���ڽ��ȡƱ����-��֤����"
       receiveunit, --�տ���
       substr(b.actiondate,1,10) actiondate --֧������
  from fbm_register a
  left join v_fbm_action_maxdate b
    on a.pk_register = b.pk_register
 where a.pk_billtypecode = '36H2'
   and a.dr = 0);
   
   
   select distinct(pk_group) from  v_yfpj  --0001ZZ100000000003AQ
   
   update fbm_register set pk_group='0001ZZ100000000003AQ' where pk_group='~'
   
   select fbmbillno  from fbm_register where pk_group='~' and pk_billtypecode = '36H2'
   
   
select pk_register, actiondate, endstatus
  from fbm_action
 where actiondate = '2018-09-21 15:10:27'

--Ʊ�ݶ���
/*����Ʊ��PK���飬ȡ����������ֵ*/

create or replace view v_fbm_action_maxdate as (
select pk_register, max(actiondate) actiondate
  from fbm_action
 where dr = 0
 group by pk_register
 )
 
 select * from v_fbm_action_maxdate 
 
 select pk_register, actiondate, endstatus
   from fbm_action
  where dr = 0
    and pk_register = '1001A41000000001UPI1';
 
 
 --ͬһ��������ڵ�ֵ��Ӧ������״̬������  
 select a.pk_register, a.actiondate, b.endstatus,b.ts
   from v_fbm_action_maxdate a, fbm_action b
  where a.pk_register = b.pk_register
    and a.actiondate = b.actiondate
    --and a.pk_register = '1001A41000000001UPI1'
    and b.dr = 0
    
    
    
    
 



