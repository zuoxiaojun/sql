create or replace view v_zjl_cdm_leasefincon as
select "PK_GROUP",
"PK_ORG",
"FUNDCONTRACTCODE",
"PAYDATE",
'�ſ�' ��ˮ��,
"PAYAMOUNT",
"PK_CURRTYPE",
"ԭ��Ϣ��",
"�ֿ�˰��",
"OLCRATE",
"BEGINDATE",
"ENDDATE",
"��IRR",
'��������' htclass
 from
 (
--cdm_leasefincon ��������
--cdm_leaseconpayplan_b  �ſ�ƻ�ҳǩ-�ſ�
select a.pk_group,
       a.pk_org,
       a.fundcontractcode,
       b.paydate,
        '�ſ�' ��ˮ��,
       to_char(b.payamount) payamount,
       a.pk_currtype,
       to_char('~') ԭ��Ϣ��,
       to_char('~') �ֿ�˰��,
       a.olcrate,
       a.begindate,
       a.enddate,
       a.vdef15 ��IRR,
       '��������' htclass
  from cdm_leasefincon a
  left join cdm_leaseconpayplan_b b
    on a.pk_leasefincon = b.pk_leasefincon
 where a.dr = '0'
   and b.dr = '0'
union all
--cdm_leaserepayplan_b ����ƻ�ҳǩ-����
select a.pk_group,
       a.pk_org,
       a.fundcontractcode,
       b.repaydate,
       '����' ��ˮ��,
       to_char(b.vbdef10),
       a.pk_currtype,
       to_char('~') ԭ��Ϣ��,
       to_char('~') �ֿ�˰��,
       a.olcrate,
       a.begindate,
       a.enddate,
       a.vdef15 ��IRR,
       '��������' htclass
  from cdm_leasefincon a
  left join cdm_leaserepayplan_b b
    on a.pk_leasefincon = b.pk_leasefincon
 where b.vbdef1 = 'Y'
   and a.dr = '0'
   and b.dr = '0'
union all
--cdm_leaserepayplan_b ����ƻ�ҳǩ-��Ϣ
select a.pk_group,
       a.pk_org,
       a.fundcontractcode,
       b.repaydate,
       '��Ϣ' ��ˮ��,
       to_char(b.vbdef9),
       a.pk_currtype,
       to_char(b.vbdef9) ԭ��Ϣ��,
       to_char(a.vdef5) �ֿ�˰��,
       a.olcrate,
       a.begindate,
       a.enddate,
       a.vdef15 ��IRR,
       '��������' htclass
  from cdm_leasefincon a
  left join cdm_leaserepayplan_b b
    on a.pk_leasefincon = b.pk_leasefincon
 where b.vbdef1 = 'N'
   and a.dr = '0'
   and b.dr = '0'
--cdm_leasefeel_b  ����ҳǩ-����
union all
select a.pk_group,
       a.pk_org,
       a.fundcontractcode,
       b.planzhifudate,
        '����' ��ˮ��,
       to_char(b.paynmy),
       b.paycurrency,
       to_char(b.paynmy) ԭ��Ϣ��,
       to_char(b.rate) �ֿ�˰��,
       a.olcrate,
       a.begindate,
       a.enddate,
       a.vdef15 ��IRR,
       '��������' htclass
  from cdm_leasefincon a
  left join cdm_leasefeel_b b
    on a.pk_leasefincon = b.pk_leasefincon
 where a.dr = '0'
   and b.dr = '0'
union all
--cdm_leasefinappcon  ��֤��-��֤��
select a.pk_group,
       a.pk_org,
       a.fundcontractcode,
       b.applydate,
        '��֤��',
       to_char(b.deposinmy),
       b.pk_currtype,
       to_char('~') ԭ��Ϣ��,
       to_char('~') �ֿ�˰��,
       a.olcrate,
       a.begindate,
       a.enddate,
       a.vdef15 ��IRR,
       '��������' htclass
  from cdm_leasefincon a
  left join cdm_leasefinappcon b
    on a.pk_leasefincon = b.pk_contract
 where a.dr = '0'
   and b.dr = '0'
)
;