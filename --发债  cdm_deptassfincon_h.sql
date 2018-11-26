
--发债  cdm_deptassfincon_h
--   cdm_deptasspayplan_b 放款计划页签-放款
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
       a.vdef15 日IRR
  from cdm_deptassfincon_h a
  left join cdm_deptasspayplan_b b
    on a.pk_fundcontract = b.pk_fundcontract
 where a.dr = '0'
   and b.dr = '0'
union all
--cdm_deptassrepayplan_b  还款计划页签-还本
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
       a.vdef15 日IRR
  from cdm_deptassfincon_h a
  left join cdm_deptassrepayplan_b b
    on a.pk_fundcontract = b.pk_fundcontract
 where b.dr = '0'
   and a.dr = '0'
   and b. vbdef1 = 'Y' --还本标志
union all
--cdm_deptassrepayplan_b  还款计划页签-还息
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
       a.vdef15 日IRR
  from cdm_deptassfincon_h a
  left join cdm_deptassrepayplan_b b
    on a.pk_fundcontract = b.pk_fundcontract
 where b.dr = '0'
   and a.dr = '0'
   and b. vbdef1 = 'N' --还息标志
union all
--cdm_deptassfeel_b   费用页签-费用
select a.pk_group,
       a.pk_org,
       a.fundcontractcode,
       b.planzhifudate,
       '费用' 流水类,
       b.paynmy,
       b.paycurrency, --费用页签币种
       to_char(b.paynmy) 原币息费,
       to_char(b.rate) 抵扣税率,
       a.olcrate,
       a.begindate,
       a.enddate,
       a.vdef15 日IRR
  from cdm_deptassfincon_h a
  left join cdm_deptassfeel_b b
    on a.pk_fundcontract = b.pk_fundcontract
 where b.dr = '0'
   and a.dr = '0'
