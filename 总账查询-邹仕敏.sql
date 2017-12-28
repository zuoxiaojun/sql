select code,name , pk_account  from bd_account where code='1002'

select pk_account ,name,code  from bd_account where pk_account = '1001A110000000000FD6';

select distinct (pk_accasoa)
  from gl_detail
 where pk_accasoa = '0001Z01000ACCOUNT002'


select *  from gl_detail where debitamount ='1067685.00'  --银行存款 1001A110000000000FD6

select assid
  from gl_detail
 where pk_accasoa = '1001A110000000000FD6' --会计科目  1002  银行存款
   and pk_accountingbook = (select pk_accountingbook
                              from org_accountingbook
                             where code = '801-XXJC') --财务核算账簿编码
   and YEARV = '2017'
   and dr = 0

select *
  from gl_docfree1
 where assid  in (select assid
                           from gl_detail
                          where pk_accasoa = '1001A110000000000FD6' --会计科目  1002  银行存款
                            and pk_accountingbook =
                                (select pk_accountingbook
                                   from org_accountingbook
                                  where code = '801-XXJC') --财务核算账簿编码
                            and YEARV = '2017'
                            and dr = 0)
                            
select * from bd_bankaccbas where   pk_bankaccbas ='1001B1100000000160DS'



select pk_entity from bd_accass where 


