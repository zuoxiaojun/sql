select pk_account, init_primal
  from cmp_initdata
 where pk_account = '1001B110000000016097' --查询期初余额


select payaccount
  from ap_payitem
 where pk_paybill = (select pk_paybill
                       from ap_paybill
                      where billno = '80501FK18040006') --付款单表体付款银行账户
                      
                      
  
  select pk_account
    from cmp_detail
   where pk_settlement =
         (select pk_settlement
            from cmp_settlement
           where billcode = '80501FK18040006') --for update  结算信息表体银行账户
 
