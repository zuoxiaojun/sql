   /*   总账执行对账数据取值来源  */

 -- select * from bd_currtype where PK_CURRTYPE='1002Z0100000000001K1'
     
select pk_currtype, pk_item
  from arap_tally
 where billno = '82500YF18110133' for update ;  --1002Z0100000000001K8
  
--select pk_currtype from arap_busidata where pk_item in ('1001D110000000DJHG1K','1001D110000000DJHG1L')

--select pk_currtype from arap_termitem where pk_item in ('1001D110000000DJHFV0','1001D110000000DJHFV1')

--select pk_currtype from ap_payableitem where pk_payableitem in  ('1001D110000000DJHFV0','1001D110000000DJHFV1')

update arap_tally
   set pk_currtype = '1002Z0100000000001K8'
 where billno in ('82500YF18110143', '82500YF18110129')

select pk_billtype,pk_currtype ,pk_tradetypeid  from ap_payablebill where billno ='82500YF18110084' --1001D11000000091JS53

--查询出arap_tally中与应付单上币种不符合数据
select distinct(billno)
  from arap_tally
 where billno in (select billno
                    from ap_payablebill
                   where pk_currtype = '1002Z0100000000001K8'
                     and pk_tradetypeid = '1001D11000000091JS53'
                     and dr = 0)
   and pk_currtype = '1002Z0100000000001K1'

--更新币种
update arap_tally
   set pk_currtype = '1002Z0100000000001K8'
 where billno in
       (select distinct (billno)
          from arap_tally
         where billno in (select billno
                            from ap_payablebill
                           where pk_currtype = '1002Z0100000000001K8'
                             and pk_tradetypeid = '1001D11000000091JS53'
                             and dr = 0)
           and pk_currtype = '1002Z0100000000001K1')
