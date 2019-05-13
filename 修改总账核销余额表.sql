--修改核销余额表

select PK_VOUCHER,explanation 
  from gl_voucher
 where pk_accountingbook = (select pk_accountingbook
                              from org_accountingbook
                             where code = '809-XXJC')
   and  pk_vouchertype =(select pk_vouchertype  from bd_vouchertype where name ='付款凭证')
   and year = 2017
   and period = 03  
   and num = 34   --1001D11000000013FJYI



select *
  from gl_verifydetail
 where pk_detail in
       (select pk_detail
          from gl_detail
         where PK_VOUCHER = '1001D11000000013FJYI')
   for update
