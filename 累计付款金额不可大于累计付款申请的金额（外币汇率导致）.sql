--�ۼƸ�����ɴ����ۼƸ�������Ľ���һ��ʵ��£�
--����������ʴ��ں�ͬ����
--������̣������ݸĳ�����̬���޸ĺû��ʺ��ٽ�����״̬�Ļ�������ͷ���嶼Ҫ��
              3                         1    
select busistatus,
       vbillstatus,
       modifiedtime,
       modifier,
       olcrate,
       dr    
  from cmp_apply
 where vbillno = 'SS18080268'
   for update --�������⵼�¸�����汨��  �ۼƸ�����ɴ����ۼƸ�������Ľ��


select busistatus,
       vbillstatus,
       olcrate  
  from cmp_apply_b
 where pk_apply =
       (select pk_apply from cmp_apply where vbillno = 'SS18080268')
   for update



/*�������뵥δ��������*/

select busistatus,
       vbillstatus,
       olcrate  ,
       glcpaymny ,
       gllcpaymny ,
       olcpaymny ,paymny ,
       gllcunpaymny ,
       glcunpaymny ,
       olcunpaymny ,
       unpaymny 
  from cmp_apply_b
 where pk_apply =
       (select pk_apply from cmp_apply where vbillno = 'SS18040180')
   for update
