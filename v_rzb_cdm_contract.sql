create or replace view v_rzb_cdm_contract as
select
*
  from (select
               '���д����ͬ' htclass,
               a.pk_group,
               a.issyndicatedloans, --����ǣͷ
               a.pk_org, --���ʵ�λ
               a.contractcode, --���ʺ�ͬ��
               a.fadinratecode, --����Ʒ��
               to_char('') bdzc,--����ʲ�
               b.pk_creditaggreement, -- ���ź�ͬ��
               b.def3, -- ���ŵ�λ(�ͻ�)
               b.def2, --���Ż��������У�
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
               to_number(a.leftrepayamount) - to_number(decode(a.vdef9, '~', '0')) whck,--δ������
               a.leftinterest, --δ��Ϣ��
               a.olccontractmnt, --���Һ�ͬ���
               (to_number(a.contractamount) - to_number(decode(a.vdef9, '~', '0'))) *olcrate  bbhtck,  --���Һ�ͬ����
               a.leftrepayamount*a.olcrate   bbwhbj,  --����δ������
               (a.leftrepayamount-to_number(decode(a.vdef9, '~', '0')))*olcrate  bbwhck,    --����δ������
               leftinterest*olcrate bbwhxf ,  --����δ��Ϣ��
               ((to_number(decode(vdef9, '~', '0'))) / (contractamount))  bzjl, --��֤����
               a.ratetype, --�������
               a.vdef15, --IRR
               b.dr
          from cdm_contract a   --���ʱ�-���д����ͬ
          left join cdm_creditReduce b
            on a. pk_contract = b. pk_contract
         where a.contracttype = 'BANKCREDIT'
           and a.dr = '0')
/*����a����ֵ��b��ûֵ���������������һ��b.dr*/
 where nvl(dr, 0) = '0'
;