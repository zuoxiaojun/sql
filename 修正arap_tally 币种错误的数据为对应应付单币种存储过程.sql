--修正arap_tally 币种错误的数据为对应应付单币种
create or replace procedure update_arap_tally 
 as
begin
  update arap_tally
     set pk_currtype = '1002Z0100000000001K8'
   where billno in
         (select distinct (billno)
            from arap_tally
           where billno in (select billno
                              from ap_payablebill
                             where pk_currtype = '1002Z0100000000001K8'--美元
                               and pk_tradetypeid = '1001D11000000091JS53'
                               and dr = 0)
             and pk_currtype = '1002Z0100000000001K1');--人民币
  commit;
end;
