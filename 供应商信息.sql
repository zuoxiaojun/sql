select a.code       "��Ӧ�̱���",
       a.name       "��Ӧ������",
       b.detailinfo "��ַ",
       c.name       "����",
       b.country    "����",
       email        "�ʼ�"
  from bd_supplier a
  left join bd_address b
    on a.corpaddress = b. pk_address
  left join bd_region c
    on b.city = c. pk_region


