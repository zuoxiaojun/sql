--�ۼƸ�����ɴ����ۼƸ�����������ݻ�д���⣩
--�������뵥����
--����ƻ���д
select  pk_apply  from  cmp_apply where vbillno ='SS18051874'--1001D110000000ADM8W7

select olcapplymny, glcapplymny, olcorigapplymny, origapplymny,olcrate 
  from cmp_apply_b
 where pk_apply = '1001D110000000ADM8W7'
   for update;

select naccumpayappmny, --�ۼƸ������뱾�ҽ��
naccumpayapporgmny, --�ۼƸ���������
nexchangerate
  from ct_payplan
 where pk_ct_pu = (select pk_ct_pu
                     from ct_pu
                    where vbillcode = 'GCL/XXJC-SJX-2018-0017')
   for update --1312717.56000000
