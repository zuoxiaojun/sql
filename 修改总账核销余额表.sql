--ÐÞ¸ÄºËÏúÓà¶î±í

select PK_VOUCHER
  from gl_voucher
 where pk_accountingbook = (select pk_accountingbook
                              from org_accountingbook
                             where code = '80501-XXJC')
   and year = 2017
   and period = 06
   and num = 127   --1001D1100000003DSSAS



select *
  from gl_verifydetail
 where pk_detail in
       (select pk_detail
          from gl_detail
         where PK_VOUCHER = '1001D1100000003DSSAS')
   for update
