
--����븶���������

--����һ��������������
 select CONTRACTNO,
        TOP_BILLID,
        TOP_BILLTYPE,
        TOP_ITEMID
   from ap_payitem
  where billno = '84200FK19050007'
    and dr = 0 
    
--1	GCL-GG-1508-002/001-JSZS	1001D110000000HC3QZP	36D1	1001D110000000HC3QZQ

select billno,
       CONTRACTNO,
       TOP_BILLID,
       TOP_BILLTYPE,
       TOP_ITEMID,
       --���ɹ������ֶ�
       dr
  from ap_payitem
 where billno = '84200FK19050008'
   and dr = 0
   for update
     ;
 
 
   
   --���ݸ��������ѯ�������ɵĸ���Ľ��
select billno, sum(money_de)
  from ap_payitem
 where top_itemid in
       (select pk_apply_b
          from cmp_apply_b
         where pk_apply in
               (select pk_apply
                  from cmp_apply
                 where vbillno = 'SS19010013'
                   and dr = '0'
                   and pk_acceptorg = (select pk_financeorg
                                         from org_financeorg
                                        where code = '842'))) --������֯
   and dr = 0
 group by billno;
   
   --��д������
   select pk_apply,
       applysum, --���븶����ϼ� 
       applymny_cap,
       olcrate ,--��֯���һ���
       olcactualpaysum, --ʵ�����ϼ�(��֯����)
       actualpaysum, --ʵ�����ϼ�
       olcorigapplysum, --ԭʼ������ϼ�(��֯����) 
       olcpaysum, --������ϼ�(��֯����)   
       paysum, --������ϼ�                   7000000
       glcunpaysum, --δ�����ϼ�(���ű���)     0
       gllcunpaysum, --δ�����ϼ�(ȫ�ֱ���)
       olcunpaysum, --δ�����ϼ�(��֯����)
       unpaysum, --δ�����ϼ�                   
       busistatus --1=���ύ��2=��������3=�����ɣ�4=�������ɣ�5=�����ɣ�-1=����̬�� 
  from cmp_apply
 where vbillno = 'SS19010013'
   and pk_apply = '1001D110000000HC3QZP'
   for update --1001D110000000HC3QZP
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
 where pk_apply = '1001D110000000HC3QZP'
   for update

   
