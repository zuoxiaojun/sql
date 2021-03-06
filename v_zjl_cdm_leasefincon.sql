create or replace view v_zjl_cdm_leasefincon as
select "PK_GROUP",
"PK_ORG",
"FUNDCONTRACTCODE",
"PAYDATE",
'放款' 流水类,
"PAYAMOUNT",
"PK_CURRTYPE",
"原币息费",
"抵扣税率",
"OLCRATE",
"BEGINDATE",
"ENDDATE",
"日IRR",
'融资租赁' htclass
 from
 (
--cdm_leasefincon 融资租赁
--cdm_leaseconpayplan_b  放款计划页签-放款
select a.pk_group,
       a.pk_org,
       a.fundcontractcode,
       b.paydate,
        '放款' 流水类,
       to_char(b.payamount) payamount,
       a.pk_currtype,
       to_char('~') 原币息费,
       to_char('~') 抵扣税率,
       a.olcrate,
       a.begindate,
       a.enddate,
       a.vdef15 日IRR,
       '融资租赁' htclass
  from cdm_leasefincon a
  left join cdm_leaseconpayplan_b b
    on a.pk_leasefincon = b.pk_leasefincon
 where a.dr = '0'
   and b.dr = '0'
union all
--cdm_leaserepayplan_b 还款计划页签-还本
select a.pk_group,
       a.pk_org,
       a.fundcontractcode,
       b.repaydate,
       '还本' 流水类,
       to_char(b.vbdef10),
       a.pk_currtype,
       to_char('~') 原币息费,
       to_char('~') 抵扣税率,
       a.olcrate,
       a.begindate,
       a.enddate,
       a.vdef15 日IRR,
       '融资租赁' htclass
  from cdm_leasefincon a
  left join cdm_leaserepayplan_b b
    on a.pk_leasefincon = b.pk_leasefincon
 where b.vbdef1 = 'Y'
   and a.dr = '0'
   and b.dr = '0'
union all
--cdm_leaserepayplan_b 还款计划页签-还息
select a.pk_group,
       a.pk_org,
       a.fundcontractcode,
       b.repaydate,
       '还息' 流水类,
       to_char(b.vbdef9),
       a.pk_currtype,
       to_char(b.vbdef9) 原币息费,
       to_char(a.vdef5) 抵扣税率,
       a.olcrate,
       a.begindate,
       a.enddate,
       a.vdef15 日IRR,
       '融资租赁' htclass
  from cdm_leasefincon a
  left join cdm_leaserepayplan_b b
    on a.pk_leasefincon = b.pk_leasefincon
 where b.vbdef1 = 'N'
   and a.dr = '0'
   and b.dr = '0'
--cdm_leasefeel_b  费用页签-费用
union all
select a.pk_group,
       a.pk_org,
       a.fundcontractcode,
       b.planzhifudate,
        '费用' 流水类,
       to_char(b.paynmy),
       b.paycurrency,
       to_char(b.paynmy) 原币息费,
       to_char(b.rate) 抵扣税率,
       a.olcrate,
       a.begindate,
       a.enddate,
       a.vdef15 日IRR,
       '融资租赁' htclass
  from cdm_leasefincon a
  left join cdm_leasefeel_b b
    on a.pk_leasefincon = b.pk_leasefincon
 where a.dr = '0'
   and b.dr = '0'
union all
--cdm_leasefinappcon  保证金-保证金
select a.pk_group,
       a.pk_org,
       a.fundcontractcode,
       b.applydate,
        '保证金',
       to_char(b.deposinmy),
       b.pk_currtype,
       to_char('~') 原币息费,
       to_char('~') 抵扣税率,
       a.olcrate,
       a.begindate,
       a.enddate,
       a.vdef15 日IRR,
       '融资租赁' htclass
  from cdm_leasefincon a
  left join cdm_leasefinappcon b
    on a.pk_leasefincon = b.pk_contract
 where a.dr = '0'
   and b.dr = '0'
)
;
