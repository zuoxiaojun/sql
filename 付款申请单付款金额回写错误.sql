select busistatus,
       pk_apply,
       applysum, --���븶����ϼ� 
       applymny_cap,
       olcactualpaysum, --ʵ�����ϼ�(��֯����)
     actualpaysum,--ʵ�����ϼ�
       olcorigapplysum, --ԭʼ������ϼ�(��֯����) 
       olcpaysum, --������ϼ�(��֯����)
       paysum, --������ϼ�                     5586840.82000000
       glcunpaysum, --δ�����ϼ�(���ű���)      0
       gllcunpaysum, --δ�����ϼ�(ȫ�ֱ���)
       olcunpaysum, --δ�����ϼ�(��֯����)
       unpaysum, --δ�����ϼ�
       busistatus --1=���ύ��2=��������3=�����ɣ�4=�������ɣ�5=�����ɣ�-1=����̬�� 
  from cmp_apply
 where vbillno = 'SS18112292'
   and pk_apply = '1001D110000000C6I13W'
   for update --1001D110000000C6I13W
;
select paymny, --�ۼƸ�����
       olcpaymny, --�ۼƸ�����(��֯����)
       glcpaymny, --�ۼƸ�����(���ű���) 
       gllcpaymny, --�ۼƸ�����(ȫ�ֱ���)
       gllcapplymny, --���븶����(ȫ�ֱ���)
       dr,
       applymny, --���븶����
       glcapplymny, --���븶����(���ű���) 
       glcorigapplymny, --ԭʼ���븶����(���ű���)
       gllcapplymny, --���븶����(ȫ�ֱ���) 
       olcapplymny, --���븶����(��֯����)   
       glcunpaymny, --δ��
       gllcunpaymny,
       olcunpaymny,
       unpaymny,
       busistatus
  from cmp_apply_b
 where pk_apply = '1001D110000000C6I13W'
   for update
