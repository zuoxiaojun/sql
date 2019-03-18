
--���б��볤�Ȳ�����12λ�����е���
/*create or replace view v_bank_nolen_12 as */

/*��ѯ�������õ������˻�*/
--select count(*) from cc_bankprotocol where dr=0

--��ҵ����Э��
select '��ҵ����Э��',
       'cc_bankprotocol',
       protocolcode,
       'pk_bankprotocol',
       pk_bankprotocol,
       'pk_creditbank',
       pk_creditbank --����
  from cc_bankprotocol
 where pk_creditbank in (select pk_bankdoc from v_bank_nolen_12)
   and dr = 0
   
   select '��ҵ����Э���ӱ�',
          'CC_CREDITDETAILS',
          PK_BANKPROTOCOL,
          'PK_CREDITDETAILS',
          PK_CREDITDETAILS, --����pk
          'def1',
          def1 --��ػ��������У�
     from CC_CREDITDETAILS
    where def1 in (select pk_bankdoc from v_bank_nolen_12)
   -- and PK_BANKPROTOCOL = '1001A41000000001TDZN'
   
   
union all
--������Ȩ
select '������Ȩ����',
       'gpm_guaproperty',
       pledgeno,
       'pk_guaproperty',
       pk_guaproperty,
       'vdef4',
       vdef4 --��Ȩ�ˣ����У�
  from gpm_guaproperty
 where vdef4 in (select pk_bankdoc from v_bank_nolen_12)
   and dr = 0
union all
--������ͬ
select '������ͬ',
       'gpm_guacontract',
       contractno,
       'pk_guacontract',
       pk_guacontract,
       'creditorba',
       creditorba --ծȨ�ˣ����У�
  from gpm_guacontract
 where creditorba in (select pk_bankdoc from v_bank_nolen_12)

union all

--Ʊ�ݵǼ� 
select 'Ʊ�ݵǼ�-�տ�����',
       'fbm_register',
       fbmbillno,
       'pk_register',
       pk_register,
       'hidereceivebank',
       hidereceivebank --�տ����� 
  from fbm_register
 where hidereceivebank in (select pk_bankdoc from v_bank_nolen_12)
   and dr = 0
union all
select 'Ʊ�ݵǼ�-��������',
       'fbm_register',
       fbmbillno,
       'pk_register',
       pk_register,
       'hidepaybank',
       hidepaybank --�������� 
  from fbm_register
 where hidepaybank in (select pk_bankdoc from v_bank_nolen_12)
   and dr = 0
union all
--�����йܣ���������
select '�����й�&&��������',
       'fbm_storage',
       vbillno,
       'pk_storage',
       pk_storage,
       'pk_bankdoc',
       pk_bankdoc --��������
  from fbm_storage
 where pk_bankdoc in (select pk_bankdoc from v_bank_nolen_12)
   and dr = 0
union all
--��������
select '��������',
       'fbm_consignbank',
       vbillno,
       'pk_consignbank',
       pk_consignbank,
       'pk_holderbank',
       pk_holderbank --��������
  from fbm_consignbank
 where pk_holderbank in (select pk_bankdoc from v_bank_nolen_12)
union all
--��������
select '��������&&���ְ���',
       'fbm_discount',
       vbillno,
       'pk_discount',
       pk_discount,
       'pk_discount_bank',
       pk_discount_bank --��������
  from fbm_discount
 where pk_discount_bank in (select pk_bankdoc from v_bank_nolen_12)
union all
--Ʊ����Ѻ
select 'Ʊ����Ѻ',
       'fbm_impawn',
       vbillno,
       'pk_impawn',
       pk_impawn,
       'impawnbank',
       impawnbank --��Ѻ����
  from fbm_impawn
 where impawnbank in (select pk_bankdoc from v_bank_nolen_12)
union all
--��Ʊ����
select '��Ʊ����',
       'cfbm_sign_apply',
       vbillno,
       'pk_sign_apply',
       pk_sign_apply,
       'signapplybank',
       signapplybank --��Ʊ����
  from cfbm_sign_apply
 where signapplybank in (select pk_bankdoc from v_bank_nolen_12)
union all
--Ʊ��ǩ��-��������
select 'Ʊ��ǩ��-��������',
       'fbm_register',
       fbmbillno,
       'pk_register',
       pk_register,
       'hidepaybank',
       hidepaybank --�������� 
  from fbm_register
 where hidereceivebank in (select pk_bankdoc from v_bank_nolen_12)
   and dr = 0
   and hidepaybank <> '~'
union all
--Ʊ��ǩ��-�տ�����
select 'Ʊ�ݵǼ�-�տ�����',
       'fbm_register',
       fbmbillno,
       'pk_register',
       pk_register,
       'hidereceivebank',
       hidereceivebank --�տ����� 
  from fbm_register
 where hidereceivebank in (select pk_bankdoc from v_bank_nolen_12)
   and dr = 0
union all
--Ʊ��ǩ��-��������
select 'Ʊ�ݵǼ�-��������',
       'fbm_register',
       fbmbillno,
       'pk_register',
       pk_register,
       'ccbank',
       ccbank --�������� 
  from fbm_register
 where hidereceivebank in (select pk_bankdoc from v_bank_nolen_12)
   and dr = 0
   and ccbank is not null
   and ccbank <> '~'
union all
--Ʊ�ݸ���
select 'Ʊ�ݸ���',
       'fbm_accept',
       vbillno,
       'pk_accept',
       pk_accept,
       'ccbank',
       ccbank --��������
  from fbm_accept
 where ccbank in (select pk_bankdoc from v_bank_nolen_12)
union all
--��֤����-��֤��
select '��֤����-��֤��',
       'lcm_apply',
       vbillno,
       'pk_apply',
       pk_apply,
       'pk_bank_issuing',
       pk_bank_issuing --��֤��
  from lcm_apply
 where pk_bank_issuing in (select pk_bankdoc from v_bank_nolen_12)
union all
--��֤����-��������
select '��֤����-��������',
       'lcm_apply',
       vbillno,
       'pk_apply',
       pk_apply,
       'pk_bank_nego',
       pk_bank_nego --��������
  from lcm_apply
 where pk_bank_issuing in (select pk_bankdoc from v_bank_nolen_12)
union all
--��֤�Ǽ�-��֤��
select '��֤�Ǽ�-��֤��',
       'lcm_openregister',
       vbillno,
       'pk_register',
       pk_register,
       'pk_bank_issuing',
       pk_bank_issuing --��֤��
  from lcm_openregister
 where pk_bank_issuing in (select pk_bankdoc from v_bank_nolen_12)
union all
--��֤�Ǽ�-��������
select '��֤�Ǽ�-��������',
       'lcm_openregister',
       vbillno,
       'pk_register',
       pk_register,
       'pk_bank_nego',
       pk_bank_nego --�������� 
  from lcm_openregister
 where pk_bank_nego in (select pk_bankdoc from v_bank_nolen_12)
union all

--�����и�
select '�����и�',
       'lcm_arrival',
       vbillno,
       'pk_arrival',
       pk_arrival,
       'pk_openbank',
       pk_openbank --��֤��
  from lcm_arrival
 where pk_openbank in (select pk_bankdoc from v_bank_nolen_12)

--����Ǽ�
/*   ����ǼǵĿ�֤��Ϊ�����ֶΣ��������޴��ֶ�
select '����Ǽ�',
vbillno,
pk_payment 

 from lcm_payment*/
union all
--��֤�Ǽ�-֪ͨ��
select '��֤�Ǽ�-֪ͨ��',
       'lcm_receiveregister',
       vbillno,
       'pk_receiptregister',
       pk_receiptregister,
       'pk_advisingbank',
       pk_advisingbank --֪ͨ��
  from lcm_receiveregister
 where pk_advisingbank in (select pk_bankdoc from v_bank_nolen_12)
union all
--��֤�Ǽ�-��֤��
select '��֤�Ǽ�-֪ͨ��',
       'lcm_receiveregister',
       vbillno,
       'pk_receiptregister',
       pk_receiptregister,
       'pk_receivebank',
       pk_receivebank --��֤��
  from lcm_receiveregister
 where pk_receivebank in (select pk_bankdoc from v_bank_nolen_12)
union all
--��֤�Ǽ�-�鸶��
select '��֤�Ǽ�-�鸶��',
       'lcm_receiveregister',
       vbillno,
       'pk_receiptregister',
       pk_receiptregister,
       'pk_negotiatedbank',
       pk_negotiatedbank --�鸶��
  from lcm_receiveregister
 where pk_negotiatedbank in (select pk_bankdoc from v_bank_nolen_12)
union all
--�����Ǽ�
select '�����Ǽ�',
       'lcm_submissionregister',
       vbillno,
       'pk_submissionregister',
       pk_submissionregister,
       'pk_receivebank',
       pk_receivebank --�յ�����
  from lcm_submissionregister
 where pk_receivebank in (select pk_bankdoc from v_bank_nolen_12)
union all
--֪ͨ�տ�
select '֪ͨ�տ�',
       'lcm_collectionnotice',
       vbillno,
       'pk_collectionnotice',
       pk_collectionnotice,
       'pk_receivebank', --�յ�����
       pk_receivebank
  from lcm_collectionnotice
 where pk_receivebank in (select pk_bankdoc from v_bank_nolen_12)
   and dr = 0
union all
--���д����ͬ����-��������
select '���д����ͬ����-��������',
       'cdm_apply',
       applycode,
       'pk_apply',
       pk_apply,
       'pk_creditbank',
       pk_creditbank --��������
  from cdm_apply
 where dr = 0
      --and applycode = '36FA18080059'
   and pk_creditbank in (select pk_bankdoc from v_bank_nolen_12)
union all
--���д����ͬ����-�������� 
select '���д����ͬ����-��������',
       'cdm_apply',
       applycode,
       'pk_apply',
       pk_apply,
       'pk_consignbank',
       pk_consignbank --��������
  from cdm_apply
 where dr = 0
   and pk_consignbank in (select pk_bankdoc from v_bank_nolen_12)
union all
--���д����ͬ
select '���д����ͬ',
       'cdm_contract',
       contractcode,
       'pk_contract',
       pk_contract,
       'pk_creditbank',
       pk_creditbank --�������� 
  from cdm_contract
 where pk_creditbank in (select pk_bankdoc from v_bank_nolen_12)

union all
--�����ͬ�����ӱ�
select '�����ͬ�����ӱ�',
       'cdm_creditReduce',
       PK_CONTRACT,
       'PK_CREDITDEDUCTION',
       PK_CREDITDEDUCTION,
       'PK_BANK',
       PK_BANK --��������
  from cdm_creditReduce
 where PK_BANK in (select pk_bankdoc from v_bank_nolen_12)

--��ͬ�ſ�
/*��ͬ�ſ������о������ú�ͬ�������ݣ��������޴��ֶ�
select 
'��ͬ�ſ�',
vbillno ,
  pk_payrcpt 
 from cdm_payrcpt where vbillno ='36FG18110001'
*/

--��ͬ����
/*
��ͬ���������о������ú�ͬ�������ݣ��������޴��ֶ�

select 
*
 from cdm_repayrcpt where vbillno = '36FH18100006'

*/
union all
--��������
select '��������',
       'bgm_openapply',
       vbillno,
       'pk_openapply',
       pk_openapply,
       'pk_guaranteebank',
       pk_guaranteebank --��������
  from bgm_openapply
 where pk_guaranteebank in (select pk_bankdoc from v_bank_nolen_12)

union all
--�����Ǽ�
select '�����Ǽ�',
       'bgm_openregister',
       vbillno,
       'pk_openregister',
       pk_openregister,
       'pk_guaranteebank',
       pk_guaranteebank --��������
  from bgm_openregister
 where pk_guaranteebank in (select pk_bankdoc from v_bank_nolen_12)
union all

--�պ��Ǽ�
select '�պ��Ǽ�',
       'bgm_receiveregister',
       vbillno,
       'pk_receiveregister',
       pk_receiveregister,
       'pk_guaranteebank',
       pk_guaranteebank --��������
  from bgm_receiveregister
 where pk_guaranteebank in (select pk_bankdoc from v_bank_nolen_12)
