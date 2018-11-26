create or replace view v_zjl_cdm_xtcontract as
select "PK_GROUP",
       "PK_ORG",
       "CONTRACTCODE",
       "PAYDATE",
       "流水类",
       to_char("PAYAMOUNT") PAYAMOUNT,
       "PK_CURRTYPE",
       "原币息费",
       "抵扣税率",
       "OLCRATE",
       "BEGINDATE",
       "ENDDATE",
       "日IRR",
       '信托' htclass
  from (
  --  '信托'   cdm_xtcontract

  --  cdm_xtpayplan 放款计划页签-放款
select a.pk_group,
       a.pk_org,
       a.contractcode,
       b.paydate,
       '放款' 流水类,
       b.payamount,
       a.pk_currtype,
       to_char('~') 原币息费,
       to_char('~') 抵扣税率,
       a.olcrate,
       a.begindate,
       a.enddate,
       a.vdef15 日IRR,
        '信托' htclass
  from cdm_xtcontract a
  left join cdm_xtpayplan b
    on a.pk_contract = b.pk_contract
 where a.dr = '0'
   and b.dr = '0'
union all
--  cdm_xtrepayplan 放款计划页签-还本
select a.pk_group,
       a.pk_org,
       a.contractcode,
       b.repaydate,
       '还本' 流水类,
       b.preamount,
       a.pk_currtype,
       to_char('~') 原币息费,
       to_char('~') 抵扣税率,
       a.olcrate,
       a.begindate,
       a.enddate,
       a.vdef15 日IRR,
        '信托' htclass
  from cdm_xtcontract a
  left join cdm_xtrepayplan b
    on a.pk_contract = b.pk_contract
 where b.dr = '0'
   and a.dr = '0'
   and b. vdef1 = 'Y' --还本标志
union all
--  cdm_xtrepayplan 放款计划页签-还息
select a.pk_group,
       a.pk_org,
       a.contractcode,
       b.repaydate,
       '还息' 流水类,
       b.preinterest,
       a.pk_currtype,
       to_char(b.preinterest) 原币息费,
       to_char('~') 抵扣税率,
       a.olcrate,
       a.begindate,
       a.enddate,
       a.vdef15 日IRR,
        '信托' htclass
  from cdm_xtcontract a
  left join cdm_xtrepayplan b
    on a.pk_contract = b.pk_contract
 where b.dr = '0'
   and a.dr = '0'
   and b. vdef1 = 'N' --还息标志
union all
--  cdm_xtFeel  费用页签-费用
select a.pk_group,
       a.pk_org,
       a.contractcode,
       b.planzhifudate,
       '费用' 流水类,
       b.paynmy,
       b.paycurrency, --费用页签币种
       to_char(b.paynmy) 原币息费,
       to_char(b.rate) 抵扣税率,
       a.olcrate,
       a.begindate,
       a.enddate,
       a.vdef15 日IRR,
        '信托' htclass
  from cdm_xtcontract a
  left join cdm_xtFeel b
    on a.pk_contract = b.pk_contract
 where b.dr = '0'
   and a.dr = '0'
union all
--  cdm_xtapply 保证金-保证金
select a.pk_group,
       a.pk_org,
       a.contractcode,
       b.applydate,
       '保证金',
       b.deposinmy,
       a.pk_currtype,
       to_char('~') 原币息费,
       to_char('~') 抵扣税率,
       b.olcrate,
       b.begindate,
       b.enddate,
       b.vdef15 日IRR,
        '信托' htclass
  from cdm_xtcontract a
  left join cdm_xtapply b
    on a.pk_contract = b.pk_contract
 where b.dr = '0'
   and a.dr = '0'
   and deposinmy is not null --保证金为空则不显示
)
;
