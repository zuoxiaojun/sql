
 --��ѯ�������տ�ʱ��Ϊ�����۶������ڵ����ۺ�ͬ   
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
                                      where name = '���۶�������')))
    and blatest = 'Y'
