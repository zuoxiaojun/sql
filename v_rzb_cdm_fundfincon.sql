create or replace view v_rzb_cdm_fundfincon as
(
select *
  from (select
                '����'  htclass,
                a.pk_group,
               a.issyndicatedloans, --����ǣͷ
               a.pk_org, --���ʵ�λ
               a.fundcontractcode, --���ʺ�ͬ��
               a.vdef2, --����Ʒ��
               to_char(' ') bdzc,--����ʲ�
               b.pk_creditaggreement, --���ź�ͬ��
               b.vbdef1, --���ŵ�λ
               b.pk_bank, --���Ż���
               a.ronzijgclass1, --�������
               a.creditcorpname, --�ſ����
               a.enddate, --������
               a.begindate, --��ʼ��
               a.pk_currtype, --���ʱ���
               a.olcrate, --����
               a.contractamount, --��ͬ���
               to_char(a.depositamount) bzj, --��֤��
               b.creditquota, --��ͬ����
               a.repayamount, --�ѻ�����
               a.leftrepayamount, --δ������
               (a.leftrepayamount - a.depositamount) whck, --δ������
               a.leftinterest, --δ��Ϣ��
               a.olccontractmnt, --���Һ�ͬ���
               (a.contractamount - a.depositamount) * (a.olcrate) bbhtck, --���Һ�ͬ����
               (a.leftrepayamount * a.olcrate) bbwhbj, --����δ������
               (a.leftrepayamount - a.depositamount) * a.olcrate bbwhck, --����δ������
               a.leftinterest * a.olcrate bbwhxf, --����δ��Ϣ��
               (a.depositamount / a.contractamount) bzjl, --��֤����
               a.ratetype1, --�������
               a.vreserve7, --IRR
               b.dr
          from cdm_fundfincon a --����
          left join cdm_fundcreditred b
            on a.pk_fundcontract = b.pk_fundcontract
         where a.dr = '0')
 where nvl(dr, 0) = '0' ----����a����ֵ��b��ûֵ����������ݹ���һ��b.dr
 )
;