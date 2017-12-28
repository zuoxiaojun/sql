select pk_material from bd_material  where code='0105020226' --1001B110000000009GMF
 select pk_customer from bd_customer where code='818'    --1001B11000000003RTYZ
 select   pk_costregion  from org_costregion where code ='801'  --成本域   1001D1100000000QYRNK
 select cbillid
   from ia_i5bill
  where fintransitflag in ('1','-1')
    and ccustomerid = '1001B11000000003RTYZ'
    and caccountperiod = '2017-10'
    and pk_org = '1001D1100000000QYRNK'
    and dr=0
    ;
    
 select sum(nnum )
   from ia_i5bill_b
  where cbillid in (select cbillid
                      from ia_i5bill
                     where fintransitflag in ('1', '-1')--发出商品标志 -1 非发出商品  ； 1 发出商品贷方
                       and ccustomerid = '1001B11000000003RTYZ'
                       and caccountperiod = '2017-10'
                       and pk_org = '1001D1100000000QYRNK'
                       and dr = 0)
    and cinventoryid  = '1001B110000000009GMF'  and dr=0      --综合毛利分析成本主数量的正确取值



