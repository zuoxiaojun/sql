create or replace view v_rzb_cdm_xtcontract as
select *
  from (select 
               '����' htclass,
               a.pk_group,
               a.issyndicatedloans, --����ǣͷ
               a.pk_org, --���ʵ�λ
               a.contractcode, --���ʺ�ͬ��
               a.fadinratecode1, --����Ʒ��
               c.objname,--����ʲ�
               b.pk_creditaggreement, --���ź�ͬ��
               b.def3, --���ŵ�λ
               b.pk_bank, --���Ż���
               a.ronzijgclass1, --�������
               a.creditcorpname, --�ſ����
               a.enddate, --������
               a.begindate, --��ʼ��
               a.pk_currtype, --���ʱ���
               a.olcrate, --����
               a.contractamount, --��ͬ���
               to_char(a.vdef9) bzj, --��֤��
               b.creditquota, --��ͬ����
               a.repayamount, --�ѻ�����
               a.leftrepayamount, --δ������
               to_number(a.leftrepayamount) -
               to_number(decode(a.vdef9, '~', '0')) whck, --δ������
               a.leftinterest, --δ��Ϣ��
               a.olccontractmnt, --���Һ�ͬ���
               (to_number(a.contractamount) -
               to_number(decode(a.vdef9, '~', '0'))) * olcrate bbhtck, --���Һ�ͬ����
               a.leftrepayamount * a.olcrate bbwhbj, --����δ������
               (a.leftrepayamount - to_number(decode(a.vdef9, '~', '0'))) *
               olcrate bbwhck, --����δ������
               leftinterest * olcrate bbwhxf, --����δ��Ϣ��
               ((to_number(decode(vdef9, '~', '0'))) / (contractamount)) bzjl, --��֤����
               a.ratetype1, --�������
               a.vdef15, --IRR
               b.dr
          from cdm_xtcontract a   --����
          left join cdm_xtcreditReduce b
            on a.pk_contract = b.pk_contract
            left join cdm_xtobj_b c
            on a.pk_contract=c.pk_contract
         where a.dr = 0)
 where nvl(dr, 0) = '0'----����a����ֵ��b��ûֵ���������������һ��b.dr
;