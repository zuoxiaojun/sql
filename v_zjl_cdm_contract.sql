create or replace view v_zjl_cdm_contract as
select "PK_GROUP",
       "PK_ORG",
       "CONTRACTCODE" CONTRACTCODE,
       "PAYDATE" PAYDATE,
       "��ˮ��" flow,
       to_char("PAYAMOUNT") PAYAMOUNT,
       "PK_CURRTYPE" PK_CURRTYPE,
       "ԭ��Ϣ��" ybxf,
       "�ֿ�˰��" dksl,
       "OLCRATE",
       "BEGINDATE",
       "ENDDATE",
       "VDEF15" date_IRR,
        '���д����ͬ' htclass    
  from (
        --cdm_payplan  �ſ�ƻ�ҳǩ-�ſ�
        select b.pk_group,
                b.pk_org,
                b.contractcode,
                a.paydate,
                '�ſ�' ��ˮ��,
                a.payamount,
                b.pk_currtype, --����
                to_char('~') ԭ��Ϣ��,
                to_char('~') �ֿ�˰��,
                b.olcrate,
                b.begindate,
                b.enddate,
                b.vdef15,
                '���д����ͬ' htclass
          from cdm_contract b
          left join cdm_payplan a
            on a.pk_contract = b.pk_contract
         where b.contracttype = 'BANKCREDIT'
              --and b.contractcode = 'XL201804008-2'
           and b.dr = '0'
           and a.dr = '0'
        union all
        --cdm_repayplan  ����ƻ�ҳǩ-����
        select b.pk_group,
                b.pk_org,
                b.contractcode,
                a.repaydate,
                '����',
                a.preamount,
                b.pk_currtype, --����
                to_char('~') ԭ��Ϣ��,
                to_char('~') �ֿ�˰��,
                b.olcrate,
                b.begindate,
                b.enddate,
                b.vdef15,
                 '���д����ͬ' htclass
          from cdm_contract b
          left join cdm_repayplan a
            on a.pk_contract = b.pk_contract
         where b.contracttype = 'BANKCREDIT'
              -- and b.contractcode = 'XL201804008-2'
           and a.vdef1 = 'Y'
           and b.dr = '0'
           and a.dr = '0'
        union all
        --cdm_repayplan ����ƻ�ҳǩ-��Ϣ
        select b.pk_group,
                b.pk_org,
                b.contractcode,
                a.repaydate,
                '��Ϣ',
                a.preinterest,
                b.pk_currtype,
                to_char(a.preinterest) preinterest,
                to_char('~') �ֿ�˰��,
                b.olcrate,
                b.begindate,
                b.enddate,
                b.vdef15,
                 '���д����ͬ' htclass
          from cdm_contract b
          left join cdm_repayplan a
            on a.pk_contract = b.pk_contract
         where b.contracttype = 'BANKCREDIT'
              --and b.contractcode = 'XL201804008-2'
           and a.vdef1 = 'N'
           and b.dr = '0'
           and a.dr = '0'
        union all
        --cdm_Fee ����ҳǩ-����
        select b.pk_group,
                b.pk_org,
                b.contractcode,
                a.planzhifudate,
                '����',
                a.paynmy,
                a.paycurrency,--����ҳǩ����ֵ
                to_char(a.paynmy) paynmy,
                to_char(a.rate) rate,
                b.olcrate,
                b.begindate,
                b.enddate,
                b.vdef15 ��IRR,
                 '���д����ͬ' htclass
          from cdm_contract b
          left join cdm_Feel a
            on a.pk_contract = b.pk_contract
         where b.contracttype = 'BANKCREDIT'
              --and b.contractcode = 'XL201804008-2'
           and b.dr = '0'
           and a.dr = '0'
        union all
        --cdm_apply ��֤��-��֤��
        select b.pk_group,
                b.pk_org,
                b.contractcode,
                a.applydate,
                '��֤��',
                a.deposinmy,
                b.pk_currtype,
                to_char('~') ԭ��Ϣ��,
                to_char('~') �ֿ�˰��,
                b.olcrate,
                b.begindate,
                b.enddate,
                b.vdef15,
                '���д����ͬ' htclass
          from cdm_contract b
          left join cdm_apply a
            on a.pk_contract = b.pk_contract
         where b.contracttype = 'BANKCREDIT'
              --and b.contractcode = 'XL201804008-2'
           and b.dr = '0'
           and a.dr = '0'
           and deposinmy is not null  --��֤��Ϊ������ʾ
           )
;