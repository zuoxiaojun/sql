create or replace view v_zjl_cdm_fundfincon as
select "PK_GROUP",
"PK_ORG",
"FUNDCONTRACTCODE" ��ͬ��,
"PAYDATE" ����,
"��ˮ��",
to_char("PAYAMOUNT") ���ҽ��,
"PK_CURRTYPE" ����,
"ԭ��Ϣ��",
"�ֿ�˰��",
"OLCRATE",
"BEGINDATE",
"ENDDATE",
"��IRR",
'����' htclass
from (
--����-cdm_fundpayplan-�ſ�ƻ�ҳǩ-�ſ�
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
       a.vreserve7 ��IRR,
       '����' htclass
  from cdm_fundfincon a
  left join cdm_fundpayplan b
    on a.pk_fundcontract = b.pk_fundcontract
 where a.dr = '0'
   and b.dr = '0'
union
--����-cdm_fundrepayplan-����ƻ�ҳǩ-����
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
       a.vreserve7 ��IRR,
       '����' htclass
  from cdm_fundfincon a
  left join cdm_fundrepayplan b
    on a.pk_fundcontract = b.pk_fundcontract
 where b.dr = '0'
 and a.dr='0'
   and b. vreserve1 = 'Y'
union all
--����-cdm_fundrepayplan-����ƻ�ҳǩ-��Ϣ
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
       a.vreserve7 ��IRR,
       '����' htclass
  from cdm_fundfincon a
  left join cdm_fundrepayplan b
    on a.pk_fundcontract = b.pk_fundcontract
 where b.dr = '0'
   and a.dr = '0'
   and b. vreserve1 = 'N'
   union all
   --����-cdm_fundfeel-����ҳǩ-����
 select a.pk_group,
        a.pk_org,
        a.fundcontractcode,
        b.planzhifudate,
        '����' ��ˮ��,
        b.paynmy,
        b.paycurrency,--����ҳǩ����
        to_char(b.paynmy) ԭ��Ϣ��,
        to_char(b.rate) �ֿ�˰��,
        a.olcrate,
        a.begindate,
        a.enddate,
        a.vreserve7 ��IRR,
        '����' htclass
   from cdm_fundfincon a
   left join cdm_fundfeel b
     on a.pk_fundcontract = b.pk_fundcontract
  where b.dr = '0'
    and a.dr = '0'
    union all
   --����-cdm_fundcon_h-��֤��-��֤��
    select a.pk_group,
           a.pk_org,
           a.fundcontractcode,
           b.applydate,
           '��֤��',
           b.deposinmy,
           a.pk_currtype,
           to_char('~') ԭ��Ϣ��,
           to_char('~') �ֿ�˰��,
           b.olcrate,
           b.begindate,
           b.enddate,
           a.vreserve7 ��IRR,
           '����' htclass
      from cdm_fundfincon a
      left join cdm_fundcon_h b
        on a.pk_fundcontract = b.pk_contract
     where b.dr = '0'
       and a.dr = '0'
       and deposinmy is not null --��֤��Ϊ������ʾ
       )
;
