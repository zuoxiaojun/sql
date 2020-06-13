select vendor_code, VENDOR_TYPE from SYS_VENDORS where VENDOR_TYPE='003'

select distinct(VENDOR_TYPE) from SYS_VENDORS

select * from SYS_VENDORS_LANGUAGE;

--财务共享供应商基本信息
select a.vendor_code, b.name
  from SYS_VENDORS a
  left join SYS_VENDORS_LANGUAGE b
    on a.id = b.vendor_id
 where b.language = 'zh-CN'
 and a.vendor_type='002'

