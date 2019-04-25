--平台日志
select *
  from fip_operatinglog
 where operateflag = 4
   and des_relationid is not null
   and des_billtype = 'C0'
   and not exists
 (select 1
          from gl_rtvoucher
         where pk_voucher = fip_operatinglog.des_relationid)
