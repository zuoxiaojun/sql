select pk_apply,
       applysum , --���븶����ϼ� 
       applymny_cap,
       olcactualpaysum, --ʵ�����ϼ�(��֯����)
       olcorigapplysum, --ԭʼ������ϼ�(��֯����) 
       olcpaysum, --������ϼ�(��֯����)
       paysum, --������ϼ�                           36817824.42
       glcunpaysum, --δ�����ϼ�(���ű���)      1707554.7
       gllcunpaysum, --δ�����ϼ�(ȫ�ֱ���)
       olcunpaysum, --δ�����ϼ�(��֯����)
       unpaysum --δ�����ϼ�
  from cmp_apply
 where vbillno = 'SS18113018'
 and pk_apply='1001D110000000DFQOY9'
   for update --1001D110000000DFQOY9
 
 select paymny, --�ۼƸ�����
        olcpaymny, --�ۼƸ����� ��֯����
        gllcapplymny, --���븶����(ȫ�ֱ���)
        dr,
        glcunpaymny, --δ��
        gllcunpaymny,
        olcunpaymny,
        unpaymny
   from cmp_apply_b
  where pk_apply = '1001D110000000DFQOY9'
    for update
