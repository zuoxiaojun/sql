--�ۼƸ�����ɴ����ۼƸ�������Ľ���һ��ʵ��£�
--����������ʴ��ں�ͬ����
--������̣������ݸĳ�����̬���޸ĺû��ʺ��ٽ�����״̬�Ļ�������ͷ���嶼Ҫ��

select busistatus, vbillstatus,modifiedtime ,modifier 
  from cmp_apply
 where vbillno = 'SS18050220'
   for update --�������⵼�¸�����汨��  �ۼƸ�����ɴ����ۼƸ�������Ľ��  


select  busistatus,vbillstatus 
  from cmp_apply_b
 where pk_apply =
       (select pk_apply from cmp_apply where vbillno = 'SS18050220') for update
