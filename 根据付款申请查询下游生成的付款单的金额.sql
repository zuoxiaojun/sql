--根据付款申请查询下游生成的付款单的金额
select billno, sum(money_de)
  from ap_payitem
 where top_itemid in
       (select pk_apply_b
          from cmp_apply_b
         where pk_apply in
               (select pk_apply
                  from cmp_apply
                 where vbillno ='SS19012506'
                   and dr = '0'
                   and pk_acceptorg = '0001B11000000000T16G'))--财务组织
   and dr = '0'
 group by billno
