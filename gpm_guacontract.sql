--������
create or replace view v_gpm_guacontract as (
select a.pk_group,
       a.pk_org,
       a.guarantor, --������λ
       a.vdef8, --���ʵ�λ
       a.contractno, --������ͬ��
       substr(a.guastartdate,1,10) guastartdate, --��ʼ��
       substr(a.guaenddate,1,10) guaenddate, --������
       decode(a.busistatus,
              0,
              '���ύ',
              1,
              '������',
              2,
              '��ִ��',
              3,
              '��ִ��',
              4,
              '����ֹ',
              5,
              '�ѽ���') busistatus, --״̬
       a.pk_guacurrtype, --����
       guaamount, --�����ܶ�
       a.guaamountdivcapital, --��������
       a.gualcamount, --�������
       decode(a.warliability,
              'NORMAL',
              'һ�㱣֤',
              'RALATED',
              '�������α�֤') warliability, --��������
       decode(a.guatype,
              'warrant',
              '��֤',
              'guaranty',
              '��Ѻ',
              'pledge',
              '��Ѻ',
              'mixed',
              '���') guatype, --������ʽ 
       a.dr adr,
       b.dr bdr,
       b.pk_guaproperty,        --������Ȩ��ʶ   
       b.usingamount --����ֵ
  from gpm_guacontract a
  left join GPM_GUARANTYINFO b --��Ѻ��Ϣ
    on a. pk_guacontract = b.pk_guacontract
 where a.dr = 0
   and a.ifecqr = 'N' --����ȷ��
   and nvl(b.dr, 0) = 0
   );


select * from v_gpm_guacontract
