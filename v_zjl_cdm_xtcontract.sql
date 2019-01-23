create or replace view v_zjl_cdm_xtcontract as
select "PK_GROUP",
       "PK_ORG",
       "CONTRACTCODE",
       "PAYDATE",
       "��ˮ��",
       to_char("PAYAMOUNT") PAYAMOUNT,
       "PK_CURRTYPE",
       "ԭ��Ϣ��",
       "�ֿ�˰��",
       "OLCRATE",
       "BEGINDATE",
       "ENDDATE",
       "��IRR",
       '����' htclass
  from (
  --  '����'   cdm_xtcontract

  --  cdm_xtpayplan �ſ�ƻ�ҳǩ-�ſ�
select a.pk_group,
       a.pk_org,
       a.contractcode,
       b.paydate,
       '�ſ�' ��ˮ��,
       b.payamount,
       a.pk_currtype,
       to_char('~') ԭ��Ϣ��,
       to_char('~') �ֿ�˰��,
       a.olcrate,
       a.begindate,
       a.enddate,
       a.vdef15 ��IRR,
        '����' htclass
  from cdm_xtcontract a
  left join cdm_xtpayplan b
    on a.pk_contract = b.pk_contract
 where a.dr = '0'
   and b.dr = '0'
union all
--  cdm_xtrepayplan �ſ�ƻ�ҳǩ-����
select a.pk_group,
       a.pk_org,
       a.contractcode,
       b.repaydate,
       '����' ��ˮ��,
       b.preamount,
       a.pk_currtype,
       to_char('~') ԭ��Ϣ��,
       to_char('~') �ֿ�˰��,
       a.olcrate,
       a.begindate,
       a.enddate,
       a.vdef15 ��IRR,
        '����' htclass
  from cdm_xtcontract a
  left join cdm_xtrepayplan b
    on a.pk_contract = b.pk_contract
 where b.dr = '0'
   and a.dr = '0'
   and b. vdef1 = 'Y' --������־
union all
--  cdm_xtrepayplan �ſ�ƻ�ҳǩ-��Ϣ
select a.pk_group,
       a.pk_org,
       a.contractcode,
       b.repaydate,
       '��Ϣ' ��ˮ��,
       b.preinterest,
       a.pk_currtype,
       to_char(b.preinterest) ԭ��Ϣ��,
       to_char('~') �ֿ�˰��,
       a.olcrate,
       a.begindate,
       a.enddate,
       a.vdef15 ��IRR,
        '����' htclass
  from cdm_xtcontract a
  left join cdm_xtrepayplan b
    on a.pk_contract = b.pk_contract
 where b.dr = '0'
   and a.dr = '0'
   and b. vdef1 = 'N' --��Ϣ��־
union all
--  cdm_xtFeel  ����ҳǩ-����
select a.pk_group,
       a.pk_org,
       a.contractcode,
       b.planzhifudate,
       '����' ��ˮ��,
       b.paynmy,
       b.paycurrency, --����ҳǩ����
       to_char(b.paynmy) ԭ��Ϣ��,
       to_char(b.rate) �ֿ�˰��,
       a.olcrate,
       a.begindate,
       a.enddate,
       a.vdef15 ��IRR,
        '����' htclass
  from cdm_xtcontract a
  left join cdm_xtFeel b
    on a.pk_contract = b.pk_contract
 where b.dr = '0'
   and a.dr = '0'
union all
--  cdm_xtapply ��֤��-��֤��
select a.pk_group,
       a.pk_org,
       a.contractcode,
       b.applydate,
       '��֤��',
       b.deposinmy,
       a.pk_currtype,
       to_char('~') ԭ��Ϣ��,
       to_char('~') �ֿ�˰��,
       b.olcrate,
       b.begindate,
       b.enddate,
       b.vdef15 ��IRR,
        '����' htclass
  from cdm_xtcontract a
  left join cdm_xtapply b
    on a.pk_contract = b.pk_contract
 where b.dr = '0'
   and a.dr = '0'
   and deposinmy is not null --��֤��Ϊ������ʾ
)
;