create or replace view v_zjl_cdm_contract as
select "PK_GROUP",
       "PK_ORG",
       "CONTRACTCODE" CONTRACTCODE,
       "PAYDATE" PAYDATE,
       "流水类" flow,
       to_char("PAYAMOUNT") PAYAMOUNT,
       "PK_CURRTYPE" PK_CURRTYPE,
       "原币息费" ybxf,
       "抵扣税率" dksl,
       "OLCRATE",
       "BEGINDATE",
       "ENDDATE",
       "VDEF15" date_IRR,
        '银行贷款合同' htclass    
  from (
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
                b.vdef15,
                '银行贷款合同' htclass
          from cdm_contract b
          left join cdm_payplan a
            on a.pk_contract = b.pk_contract
         where b.contracttype = 'BANKCREDIT'
              --and b.contractcode = 'XL201804008-2'
           and b.dr = '0'
           and a.dr = '0'
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
                b.vdef15,
                 '银行贷款合同' htclass
          from cdm_contract b
          left join cdm_repayplan a
            on a.pk_contract = b.pk_contract
         where b.contracttype = 'BANKCREDIT'
              -- and b.contractcode = 'XL201804008-2'
           and a.vdef1 = 'Y'
           and b.dr = '0'
           and a.dr = '0'
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
                b.vdef15,
                 '银行贷款合同' htclass
          from cdm_contract b
          left join cdm_repayplan a
            on a.pk_contract = b.pk_contract
         where b.contracttype = 'BANKCREDIT'
              --and b.contractcode = 'XL201804008-2'
           and a.vdef1 = 'N'
           and b.dr = '0'
           and a.dr = '0'
        union all
        --cdm_Fee 费用页签-费用
        select b.pk_group,
                b.pk_org,
                b.contractcode,
                a.planzhifudate,
                '费用',
                a.paynmy,
                a.paycurrency,--费用页签币种值
                to_char(a.paynmy) paynmy,
                to_char(a.rate) rate,
                b.olcrate,
                b.begindate,
                b.enddate,
                b.vdef15 日IRR,
                 '银行贷款合同' htclass
          from cdm_contract b
          left join cdm_Feel a
            on a.pk_contract = b.pk_contract
         where b.contracttype = 'BANKCREDIT'
              --and b.contractcode = 'XL201804008-2'
           and b.dr = '0'
           and a.dr = '0'
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
                b.vdef15,
                '银行贷款合同' htclass
          from cdm_contract b
          left join cdm_apply a
            on a.pk_contract = b.pk_contract
         where b.contracttype = 'BANKCREDIT'
              --and b.contractcode = 'XL201804008-2'
           and b.dr = '0'
           and a.dr = '0'
           and deposinmy is not null  --保证金为空则不显示
           )
;
