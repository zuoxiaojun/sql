select pk_accountingbook, count(num), period, pk_vouchertype, year, num
  from gl_voucher
 where period <> '00'
   and num <> '0'
 group by pk_accountingbook, period, pk_vouchertype, num, year
having count(num) >= 2


select pk_accountingbook, code
  from org_accountingbook
 where pk_accountingbook in '1001B11000000001Z980' --813

select name
  from bd_vouchertype
 where pk_vouchertype = '1001A110000000005M23' --×ªÕËÆ¾Ö¤
