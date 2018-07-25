
 --查询引用了收款时点为下销售订单日期的销售合同   
 select vbillcode, ctname
   from ct_sale
  where pk_payterm in
        (select pk_income
           from bd_income
          where pk_income = (select pk_payment
                               from bd_incomech
                              where pk_incomeperiod =
                                    (select pk_incomeperiod
                                       from bd_incomeperiod
                                      where name = '销售订单日期')))
    and blatest = 'Y'
