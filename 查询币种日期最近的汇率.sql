--查询币种日期最近的汇率
select e.ratedate, e.pk_currtype, f.rate
  from (select c.ratedate, c.pk_currtype, d.pk_currinfo
          from (select max(ratedate) ratedate, pk_currtype
                  from (select b.pk_currtype, a.ratedate
                          from bd_currrate a
                          left join bd_currinfo b
                            on a.pk_currinfo = b.pk_currinfo
                         where a.dr = 0
                           and b.dr = 0
                         order by b.pk_currtype)
                 group by pk_currtype) c
          left join bd_currinfo d
            on c.pk_currtype = d.pk_currtype) e,
       bd_currrate f
 where e.ratedate = f.ratedate
   and e.pk_currinfo = f.pk_currinfo
