--��û�з���ҵ�����ݵ������ִ��һ�½ű�����������������ѯ����ҵ���š������ִ�У��������ⲻ������
--����״̬
update org_accountingbook
   set enablestate = '2'
 where code = '?' update org_orgs set enablestate = '2'
 where code = '?';

--�����˲������ڼ�
update org_accountingbook
   set pk_accountperiod = '?', accountenablestate = '2'
 where code = '?'

--�ʲ��˲������ڼ�
 update org_accountingbook set pk_assetperiod = '?',
 assetenablestate = '2'
 where code = '?'
--����˲������ڼ�
 update org_accountingbook set pk_materialperiod = '?',
 materialenablestate = '2'
 where code = '?'
--˰���˲������ڼ�
 update org_accountingbook set pk_taxperiod = '?',
 taxenablestate = '2'
 where code = '?'
--���û���ڼ�id�����±��ѯ
  select * from BD_ACCPERIODMONTH
          
         --����codeΪ�����˲��ı��룻pk_preiodΪ����ڼ��Ӧ��id
         
         /*�˲����ͱ�org_setofbook
         ���κ����˲���org_liabilitybook
         1-δ���� 2-���� 3-��ͣ��
         
         
         ���ڲ��Ի��������ó����֤��
         �������½ű�������ϸ���ģ������ĵ���
         */
         
         --�޸�����״̬���뽫��Ҫ���õķ�����Ϊ2��
         update org_accountingbook
            set accountenablestate = '2',
                assetenablestate   = '2',
                enablestate        = '2'
          where code in ('  ');


--�޸��˲���Ŀ��
update org_accountingbook
   set pk_curraccchart = '��Ŀpk'
 where code = '�˲�����';
--��Ŀpk�ɴ����±����ҵ���
select * from bd_accchart
       
 --ҵ��Ԫ�ڼ��޸�
         select *
           from org_moduleperiod
          where pk_org in
                (select pk_org from org_orgs where code = 'ҵ��Ԫcode')
