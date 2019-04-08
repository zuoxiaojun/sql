--应收票据台账

create or replace view v_yspj as (
select decode(a.baseinfostatus,
              'on_gather',
              '在收票',
              'register',
              '已登记',
              'on_endore',
              '在背书',
              'has_endore',
              '已背书',
              'on_discount',
              '在贴现',
              'has_discount',
              '已贴现',
              'on_collection',
              '在办理托收',
              'has_collection',
              '已办理托收',
              'has_collectionsettle',
              '已托收结清',
              'on_bank_keep',
              '在银行托管',
              'has_bank_keep',
              '已银行托管',
              'on_bank_back',
              '在银行领用',
              'on_impawn',
              '在质押',
              'has_impawn',
              '已质押',
              'on_impawn_back',
              '在质押回收',
              'has_disable',
              '已作废',
              'on_return',
              '在退票',
              'has_return',
              '已退票') baseinfostatus, --票据状态  
              a.pk_group, --集团   
       a.pk_org, --主体简称
       a.fbmbilltype, --票据种类
       a.fbmbillno, --票号
       a.olcmoney, --金额
       substr(a.invoicedate, 1, 10) invoicedate, --出票日
       substr(a.enddate, 1, 10) enddate, --到期日
       a.paybank, --出票行
       a.hideinvoiceunit, --出票人
       substr(a.gatherdate, 1, 10) gatherdate, --收票日期
       a.receiveunit, --付款单位
       b.pk_discount_bank, --贴现银行
       b.discountyrate, --贴现利率
       b.discountinterest, --贴现利息
       substr(c.actiondate, 1, 10) actiondate --使用日期
  from fbm_register a
  left join fbm_discount b
    on a.pk_register = b. pk_register
  left join v_fbm_action_maxdate c
    on a.pk_register = c.pk_register
 where a.pk_billtypecode = '36H1'
   and a.dr = 0
)


select * from v_yspj

select count(*)
  from fbm_register a
  left join fbm_discount b
    on a.pk_register = b. pk_register
 where a.pk_billtypecode = '36H1'
   and a.dr = 0
   and nvl(b.dr,0)=0

   
   
   
select count(*) from fbm_register where pk_billtypecode = '36H1' and dr=0


