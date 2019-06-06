select djbh, zyx24, zyx23, skyhzh
  from er_bxzb
 where zyx24 like '%get%' --for update


--查询报销单个人银行账号开户行
select name
  from bd_bankdoc
 where pk_bankdoc =
       (select pk_bankdoc
          from bd_bankaccbas
         where accnum = (select accnum
                           from bd_bankaccsub
                          where pk_bankaccsub =
                                (select skyhzh
                                   from er_bxzb
                                  where djbh = '80501BX19050207')))

select djlxbm, djbh, zyx24, zyx23, skyhzh
  from er_bxzb
 where zyx24 like '%zyx24%'

--更新报销单zyx24为个人银行账号开户行
update er_bxzb
   set zyx24 =
       (select name
          from bd_bankdoc
         where pk_bankdoc =
               (select pk_bankdoc
                  from bd_bankaccbas
                 where accnum =
                       (select accnum
                          from bd_bankaccsub
                         where pk_bankaccsub =
                               (select skyhzh
                                  from er_bxzb
                                 where djbh = '82600BX19060001'))))
 where djbh = '82600BX19060001'
