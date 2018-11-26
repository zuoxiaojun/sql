create or replace view v_zjl_cdm_fundfincon as
select "PK_GROUP",
"PK_ORG",
"FUNDCONTRACTCODE" 合同号,
"PAYDATE" 日期,
"流水类",
to_char("PAYAMOUNT") 本币金额,
"PK_CURRTYPE" 币种,
"原币息费",
"抵扣税率",
"OLCRATE",
"BEGINDATE",
"ENDDATE",
"日IRR",
'基金' htclass
from (
--基金-cdm_fundpayplan-放款计划页签-放款
select a.pk_group,
       a.pk_org,
       a.fundcontractcode,
       b.paydate,
       '放款' 流水类,
       b.payamount,
       a.pk_currtype,
       to_char('~') 原币息费,
       to_char('~') 抵扣税率,
       a.olcrate,
       a.begindate,
       a.enddate,
       a.vreserve7 日IRR,
       '基金' htclass
  from cdm_fundfincon a
  left join cdm_fundpayplan b
    on a.pk_fundcontract = b.pk_fundcontract
 where a.dr = '0'
   and b.dr = '0'
union
--基金-cdm_fundrepayplan-还款计划页签-还本
select a.pk_group,
       a.pk_org,
       a.fundcontractcode,
       b.repaydate,
       '还本' 流水类,
       b.preamount,
       a.pk_currtype,
       to_char('~') 原币息费,
       to_char('~') 抵扣税率,
       a.olcrate,
       a.begindate,
       a.enddate,
       a.vreserve7 日IRR,
       '基金' htclass
  from cdm_fundfincon a
  left join cdm_fundrepayplan b
    on a.pk_fundcontract = b.pk_fundcontract
 where b.dr = '0'
 and a.dr='0'
   and b. vreserve1 = 'Y'
union all
--基金-cdm_fundrepayplan-还款计划页签-还息
select a.pk_group,
       a.pk_org,
       a.fundcontractcode,
       b.repaydate,
       '还息' 流水类,
       b.preinterest,
       a.pk_currtype,
       to_char(b.preinterest) 原币息费,
       to_char('~') 抵扣税率,
       a.olcrate,
       a.begindate,
       a.enddate,
       a.vreserve7 日IRR,
       '基金' htclass
  from cdm_fundfincon a
  left join cdm_fundrepayplan b
    on a.pk_fundcontract = b.pk_fundcontract
 where b.dr = '0'
   and a.dr = '0'
   and b. vreserve1 = 'N'
   union all
   --基金-cdm_fundfeel-费用页签-费用
 select a.pk_group,
        a.pk_org,
        a.fundcontractcode,
        b.planzhifudate,
        '费用' 流水类,
        b.paynmy,
        b.paycurrency,--费用页签币种
        to_char(b.paynmy) 原币息费,
        to_char(b.rate) 抵扣税率,
        a.olcrate,
        a.begindate,
        a.enddate,
        a.vreserve7 日IRR,
        '基金' htclass
   from cdm_fundfincon a
   left join cdm_fundfeel b
     on a.pk_fundcontract = b.pk_fundcontract
  where b.dr = '0'
    and a.dr = '0'
    union all
   --基金-cdm_fundcon_h-保证金-保证金
    select a.pk_group,
           a.pk_org,
           a.fundcontractcode,
           b.applydate,
           '保证金',
           b.deposinmy,
           a.pk_currtype,
           to_char('~') 原币息费,
           to_char('~') 抵扣税率,
           b.olcrate,
           b.begindate,
           b.enddate,
           a.vreserve7 日IRR,
           '基金' htclass
      from cdm_fundfincon a
      left join cdm_fundcon_h b
        on a.pk_fundcontract = b.pk_contract
     where b.dr = '0'
       and a.dr = '0'
       and deposinmy is not null --保证金为空则不显示
       )
;
