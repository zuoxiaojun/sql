select approver,creator,billmaker from cmp_apply where vbillno ='SS18051940' for update 

select cuserid from sm_user where  user_code ='177407' --1001B110000000075Y9P   pk_apply 

update cmp_apply_b
   set isprepay = 'N'
 where pk_apply =
       (select pk_apply from cmp_apply where vbillno = 'SS18051940')--更新付款申请单预付标志
       
       
       select isprepay
         from cmp_apply_b
        where pk_apply =
              (select pk_apply from cmp_apply where vbillno = 'SS18051940')
