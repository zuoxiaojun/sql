select a.code       "供应商编码",
       a.name       "供应商名称",
       b.detailinfo "地址",
       c.name       "城市",
       b.country    "国家",
       email        "邮件"
  from bd_supplier a
  left join bd_address b
    on a.corpaddress = b. pk_address
  left join bd_region c
    on b.city = c. pk_region


