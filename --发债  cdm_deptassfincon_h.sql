
--��ծ  cdm_deptassfincon_h
--   cdm_deptasspayplan_b �ſ�ƻ�ҳǩ-�ſ�
select a.pk_group,
       a.pk_org,
       a.fundcontractcode,
       b.paydate,
       '�ſ�' ��ˮ��,
       b.payamount,
       a.pk_currtype,
       to_char('~') ԭ��Ϣ��,
       to_char('~') �ֿ�˰��,
       a.olcrate,
       a.begindate,
       a.enddate,
       a.vdef15 ��IRR
  from cdm_deptassfincon_h a
  left join cdm_deptasspayplan_b b
    on a.pk_fundcontract = b.pk_fundcontract
 where a.dr = '0'
   and b.dr = '0'
union all
--cdm_deptassrepayplan_b  ����ƻ�ҳǩ-����
select a.pk_group,
       a.pk_org,
       a.fundcontractcode,
       b.repaydate,
       '����' ��ˮ��,
       b.preamount,
       a.pk_currtype,
       to_char('~') ԭ��Ϣ��,
       to_char('~') �ֿ�˰��,
       a.olcrate,
       a.begindate,
       a.enddate,
       a.vdef15 ��IRR
  from cdm_deptassfincon_h a
  left join cdm_deptassrepayplan_b b
    on a.pk_fundcontract = b.pk_fundcontract
 where b.dr = '0'
   and a.dr = '0'
   and b. vbdef1 = 'Y' --������־
union all
--cdm_deptassrepayplan_b  ����ƻ�ҳǩ-��Ϣ
select a.pk_group,
       a.pk_org,
       a.fundcontractcode,
       b.repaydate,
       '��Ϣ' ��ˮ��,
       b.preinterest,
       a.pk_currtype,
       to_char(b.preinterest) ԭ��Ϣ��,
       to_char('~') �ֿ�˰��,
       a.olcrate,
       a.begindate,
       a.enddate,
       a.vdef15 ��IRR
  from cdm_deptassfincon_h a
  left join cdm_deptassrepayplan_b b
    on a.pk_fundcontract = b.pk_fundcontract
 where b.dr = '0'
   and a.dr = '0'
   and b. vbdef1 = 'N' --��Ϣ��־
union all
--cdm_deptassfeel_b   ����ҳǩ-����
select a.pk_group,
       a.pk_org,
       a.fundcontractcode,
       b.planzhifudate,
       '����' ��ˮ��,
       b.paynmy,
       b.paycurrency, --����ҳǩ����
       to_char(b.paynmy) ԭ��Ϣ��,
       to_char(b.rate) �ֿ�˰��,
       a.olcrate,
       a.begindate,
       a.enddate,
       a.vdef15 ��IRR
  from cdm_deptassfincon_h a
  left join cdm_deptassfeel_b b
    on a.pk_fundcontract = b.pk_fundcontract
 where b.dr = '0'
   and a.dr = '0'
