
--����븶���������

--����һ��������������
 select CONTRACTNO, TOP_BILLID, TOP_BILLTYPE, TOP_ITEMID, TOP_TERMCH,local_money_de 
   from ap_payitem
  where billno = '81500FK19020045'
    and dr = 0
--3	GCL/FNXX-CG/YFL-2018-0050	1001D110000000CXA6QG	36D1	1001D110000000CXA6QH	~	68567.69000000




select CONTRACTNO,
       TOP_BILLID,
       TOP_BILLTYPE,
       TOP_ITEMID,
       TOP_TERMCH,
       local_money_de --���ɹ������ֶ�
  from ap_payitem
 where billno = '81500FK19030063'
   and dr = 0
   for update
     ;
   
   
