--更新总账的来源系统
select pk_system
  from gl_voucher
 where explanation = '收,句容协鑫集成科技有限公司货款'
   and year = '2019'
   and period = 5
   and totaldebit = 29796800.00
   for update 


select distinct(pk_system) from gl_voucher
