--���ݸ��������ѯ�������ɵĸ���Ľ��
select billno, sum(money_de)
  from ap_payitem
 where top_itemid in
       (select pk_apply_b
          from cmp_apply_b
         where pk_apply in
               (select pk_apply
                  from cmp_apply
                 where vbillno = 'SS18052470'
                   and dr = '0'
                   and pk_acceptorg = '0001B110000000007JO0')) --������֯
   and dr = '0'
 group by billno;


select  pk_financeorg  from org_financeorg where code ='809'
