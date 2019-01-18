--应收应付单据与流水币种不一致

select distinct(billno)
  from arap_tally
 where billno in (select billno
                    from ap_payablebill
                   where pk_currtype = '1002Z0100000000001K8'--美元
                    -- and pk_tradetypeid = '1001D11000000091JS53'
                     and dr = 0)
   and pk_currtype = '1002Z0100000000001K1'--人民币
   
   select distinct(billno)
  from arap_tally
 where billno in (select billno
                    from ar_recitem
                   where pk_currtype = '1002Z0100000000001K8'--美元
                    -- and pk_tradetypeid = '1001D11000000091JS53'
                     and dr = 0)
   and pk_currtype = '1002Z0100000000001K1'--人民币
