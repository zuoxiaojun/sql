
 select distinct(pk_billtypecode) from fbm_register --单据类型
/*
1	36H2  应付票据
2	36H1  应收票据
*/

create or replace  view v_yfpj  as  (
select decode(baseinfostatus,
              'on_invoice',
              '在开票',
              'has_invoice',
              '已开票',
              'on_pay',
              '在付款',
              'has_pay',
              '已付款',
              'on_paybill',
              '在付票',
              'has_paybill',
              '已付票') baseinfostatus, --票据状态   
       pk_group, --集团   
       pk_org, --主体简称
       fbmbilltype, --票据种类
       decode(impawnmode,
              'CREDIT',
              '信用',
              'ASSURE',
              '保证',
              'BAIL',
              '保证金',
              'PLEDGE',
              '抵押',
              'IMPAWN',
              '质押',
              'MIXED',
              '混合') impawnmode, --票据来源
       fbmbillno, --票号
       olcmoney, --金额
       substr(invoicedate,1,10) invoicedate, --出票日
       substr(enddate,1,10) enddate, --到期日
       paybank, --出票行
       securityrate, --保证金比例
       securitymoney ,--保证金金额
       usedccamount, --"敞口金额取票面金额-保证金金额"
       receiveunit, --收款人
       substr(b.actiondate,1,10) actiondate --支付日期
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

--票据动作
/*按照票据PK分组，取出日期最大的值*/

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
 
 
 --同一个最大日期的值对应的最终状态有两个  
 select a.pk_register, a.actiondate, b.endstatus,b.ts
   from v_fbm_action_maxdate a, fbm_action b
  where a.pk_register = b.pk_register
    and a.actiondate = b.actiondate
    --and a.pk_register = '1001A41000000001UPI1'
    and b.dr = 0
    
    
    
    
 



