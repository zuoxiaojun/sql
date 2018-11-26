/*资金流量表--银行贷款合同*/

create or replace view v_zjl_cdm_contract --银行贷款合同
as 
select * from (
--cdm_payplan  放款计划页签-放款
select b.pk_group,
       b.pk_org,
       b.contractcode,
       a.paydate,
       '放款' 流水类,
       a.payamount,
       b.pk_currtype, --币种
       to_char('~') 原币息费,
       to_char('~') 抵扣税率,
       b.olcrate,
       b.begindate,
       b.enddate,
       b.vdef15
  from cdm_payplan a
  left join cdm_contract b
    on a.pk_contract = b.pk_contract
 where b.contracttype = 'BANKCREDIT'
      --and b.contractcode = 'XL201804008-2'
   and b.dr = 0
union all
--cdm_repayplan  还款计划页签-还本 
select b.pk_group,
       b.pk_org,
       b.contractcode,
       a.repaydate,
       '还本',
       a.preamount,
       b.pk_currtype, --币种
       to_char('~') 原币息费,
       to_char('~') 抵扣税率,
       b.olcrate,
       b.begindate,
       b.enddate,
       b.vdef15
  from cdm_repayplan a
  left join cdm_contract b
    on a.pk_contract = b.pk_contract
 where b.contracttype = 'BANKCREDIT'
      -- and b.contractcode = 'XL201804008-2'
   and a.vdef1 = 'Y'
   and b.dr = '0'
union all
--cdm_repayplan 还款计划页签-还息
select b.pk_group,
       b.pk_org,
       b.contractcode,
       a.repaydate,
       '还息',
       a.preinterest,
       b.pk_currtype,
       to_char(a.preinterest) preinterest,
       to_char('~') 抵扣税率,
       b.olcrate,
       b.begindate,
       b.enddate,
       b.vdef15
  from cdm_repayplan a
  left join cdm_contract b
    on a.pk_contract = b.pk_contract
 where b.contracttype = 'BANKCREDIT'
      --and b.contractcode = 'XL201804008-2'
   and a.vdef1 = 'N'
   and b.dr = '0'
union all
--cdm_Fee 费用页签-费用
select b.pk_group,
       b.pk_org,
       b.contractcode,
       a.planzhifudate,
       '费用',
       a.paynmy,
       b.pk_currtype,
       to_char(a.paynmy) paynmy,
       to_char(a.rate) rate,
       b.olcrate,
       b.begindate,
       b.enddate,
       b.vdef15
  from cdm_Feel a
  left join cdm_contract b
    on a.pk_contract = b.pk_contract
 where b.contracttype = 'BANKCREDIT'
      --and b.contractcode = 'XL201804008-2'
   and b.dr = '0'
union all
--cdm_apply 保证金-保证金
select b.pk_group,
       b.pk_org,
       b.contractcode,
       a.applydate,
       '保证金',
       a.deposinmy,
       b.pk_currtype,
       to_char('~') 原币息费,
       to_char('~') 抵扣税率,
       b.olcrate,
       b.begindate,
       b.enddate,
       b.vdef15
  from cdm_apply a
  left join cdm_contract b
    on a.pk_contract = b.pk_contract
 where b.contracttype = 'BANKCREDIT'
      --and b.contractcode = 'XL201804008-2'
   and b.dr = '0'
   and deposinmy is not null )
