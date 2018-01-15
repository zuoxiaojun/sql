select *
  from ar_recbill
 where billno = '82500YS17110071'
   and dr = 0; --应收单主表
   
select pk_currtype, occupationmny, money_bal, money_de, local_money_bal
  from ar_recitem
 where pk_recbill = (select pk_recbill
                       from ar_recbill
                      where billno = '82500YS17110071'
                        and dr = 0); --1001D1100000007UOOBH  应收单字表

select * from bd_currtype where pk_currtype ='1002Z0100000000001K8'; --币种   美元
select * from bd_currtype where pk_currtype ='1002Z0100000000001K1'; --币种  人民币
-- 1002Z0100000000001K1

select pk_currtype from arap_termitem where pk_bill = '1001D1100000007UOOBH' --收付业务数据
select pk_currtype, arap_verifydetail.* from arap_verifydetail where pk_bill = '1001D1100000007UOOBH';

--更新核销表数据
select pk_currtype from arap_busidata where pk_bill = '1001D1100000007UOOBH';
select pk_currtype from arap_tally where pk_bill = '1001D1100000007UOOBH';
update arap_busidata set pk_currtype= '1002Z0100000000001K8' where pk_bill = '1001D1100000007UOOBH' and pk_currtype = '1002Z0100000000001K1';
update arap_tally set pk_currtype= '1002Z0100000000001K8' where pk_bill = '1001D1100000007UOOBH' and pk_currtype = '1002Z0100000000001K1';
