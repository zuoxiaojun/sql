select pk_apply,
       olcactualpaysum,--ʵ�����ϼ�(��֯����)
       olcorigapplysum,--ԭʼ������ϼ�(��֯����) 
       olcpaysum,--������ϼ�(��֯����)
       paysum,    --������ϼ�                          1470567.95000000
       glcunpaysum,--δ�����ϼ�(���ű���)      2195049.84
       gllcunpaysum,--δ�����ϼ�(ȫ�ֱ���)
       olcunpaysum,--δ�����ϼ�(��֯����)
       unpaysum--δ�����ϼ�
  from cmp_apply
 where vbillno = 'SS18071903'
   for update --1001D110000000AAY0ZQ
 
 select paymny, --�ۼƸ�����
        olcpaymny, --�ۼƸ����� ��֯����
        gllcapplymny,--���븶����(ȫ�ֱ���)
        dr,
        glcunpaymny ,
        gllcunpaymny ,
        olcunpaymny ,
        unpaymny 
   from cmp_apply_b
  where pk_apply = '1001D110000000AAY0ZQ'
    for update
