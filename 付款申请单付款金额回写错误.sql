select busistatus,
       pk_apply,
       applysum, --���븶����ϼ� 
       applymny_cap,
       olcactualpaysum, --ʵ�����ϼ�(��֯����)
       olcorigapplysum, --ԭʼ������ϼ�(��֯����) 
       olcpaysum, --������ϼ�(��֯����)
       paysum, --������ϼ�                     8500000
       glcunpaysum, --δ�����ϼ�(���ű���)      1250331.5
       gllcunpaysum, --δ�����ϼ�(ȫ�ֱ���)
       olcunpaysum, --δ�����ϼ�(��֯����)
       unpaysum --δ�����ϼ�
  from cmp_apply
 where vbillno = 'SS19033371'
--and pk_apply='1001D110000000G0ZPOX'
   for update --1001D110000000ADM8W7
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
       unpaymny
  from cmp_apply_b
 where pk_apply = '1001D110000000G0ZPOX'
   for update
