     
     --资金内贷表
     select * from v_htcl;
     select * from v_maxhtll;      
     
    select *
      from v_htcl a
      left join v_maxhtll b
        on a.pk_contractrate = b.pk_contractrate
     --where a. contractcode = '江苏华鹏8千万资金拆借'
    
    
