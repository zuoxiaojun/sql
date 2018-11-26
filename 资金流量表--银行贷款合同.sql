/*�ʽ�������--���д����ͬ*/

create or replace view v_zjl_cdm_contract --���д����ͬ
as 
select * from (
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
       b.vdef15
  from cdm_payplan a
  left join cdm_contract b
    on a.pk_contract = b.pk_contract
 where b.contracttype = 'BANKCREDIT'
      --and b.contractcode = 'XL201804008-2'
   and b.dr = 0
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
       b.vdef15
  from cdm_repayplan a
  left join cdm_contract b
    on a.pk_contract = b.pk_contract
 where b.contracttype = 'BANKCREDIT'
      -- and b.contractcode = 'XL201804008-2'
   and a.vdef1 = 'Y'
   and b.dr = '0'
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
       b.vdef15
  from cdm_repayplan a
  left join cdm_contract b
    on a.pk_contract = b.pk_contract
 where b.contracttype = 'BANKCREDIT'
      --and b.contractcode = 'XL201804008-2'
   and a.vdef1 = 'N'
   and b.dr = '0'
union all
--cdm_Fee ����ҳǩ-����
select b.pk_group,
       b.pk_org,
       b.contractcode,
       a.planzhifudate,
       '����',
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
       b.vdef15
  from cdm_apply a
  left join cdm_contract b
    on a.pk_contract = b.pk_contract
 where b.contracttype = 'BANKCREDIT'
      --and b.contractcode = 'XL201804008-2'
   and b.dr = '0'
   and deposinmy is not null )
