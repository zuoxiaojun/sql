--�ڲ������嵥��������
select cinventoryid "����",
       nqtorigtaxprice "��˰����",
       round(nqtorigprice, 4) "��˰����",
       ntaxprice "�����Һ�˰����",
       round(nprice, 4) "��������˰����",
       norigtaxmny "��˰�ϼ�",
       ntaxmny "���Ҽ�˰�ϼ�"
  from to_settlelist_b
 where cbillid =
       (select cbillid from to_settlelist where vbillcode = '5F20180629131')
