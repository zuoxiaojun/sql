select olcactualpaysum, olcorigapplysum, olcpaysum, paysum,pk_apply 
  from cmp_apply
 where vbillno = 'SS17011325' for update   --1001D1100000007UPXX2
 
 select paymny, --�ۼƸ�����
        olcpaymny, --�ۼƸ����� ��֯����
        gllcapplymny,
        dr
   from cmp_apply_b
  where pk_apply = '1001D1100000007UPXX2'-- for update
 
