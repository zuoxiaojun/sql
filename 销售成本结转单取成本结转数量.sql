select pk_material from bd_material  where code='0105020226' --1001B110000000009GMF
 select pk_customer from bd_customer where code='818'    --1001B11000000003RTYZ
 select   pk_costregion  from org_costregion where code ='801'  --�ɱ���   1001D1100000000QYRNK
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
                     where fintransitflag in ('1', '-1')--������Ʒ��־ -1 �Ƿ�����Ʒ  �� 1 ������Ʒ����
                       and ccustomerid = '1001B11000000003RTYZ'
                       and caccountperiod = '2017-10'
                       and pk_org = '1001D1100000000QYRNK'
                       and dr = 0)
    and cinventoryid  = '1001B110000000009GMF'  and dr=0      --�ۺ�ë�������ɱ�����������ȷȡֵ



