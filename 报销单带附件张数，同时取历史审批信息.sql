--������������������ͬʱȡ��ʷ������Ϣ
select a.checkman checkman,
       a.pk_org pk_org,
       substr(a.dealdate, 1, 10) dealdate,
       b.pk_billtypeid pk_billtypeid,
       a.billno,
       c.fjzs
  from pub_workflownote a
  left join bd_billtype b
    on (b.pk_billtypecode = a.pk_billtype and
       b.pk_group = '0001A110000000000MFL')
  left join er_bxzb c
    on a.billno = c.djbh
 where checkman = '1001D1100000007XTZT8'
   and substr(a.dealdate, 1, 10) = '2018-12-24'
   and a.pk_org = '0001B11000000000IIC7';

  select *
    from (select a.checkman checkman,
                 a.pk_org pk_org,
                 substr(a.dealdate, 1, 10) dealdate,
                 b.pk_billtypeid pk_billtypeid,
                 a.billno,
                 c.fjzs
            from pub_workflownote a
            left join bd_billtype b
              on (b.pk_billtypecode = a.pk_billtype and
                 b.pk_group = '0001A110000000000MFL')
            left join er_bxzb c
              on a.billno = c.djbh
           where checkman = '1001D1100000007XTZT8'
             and c.dr = '0'
             and substr(a.dealdate, 1, 10) = '2018-12-24'
             and a.pk_org = '0001B11000000000IIC7')
   where pk_billtypeid in
         (select pk_billtypeid
            from bd_billtype
           where pk_billtypecode in
                 ('264X-Cxx-001', '264X-Cxx-002', '2641', '2647', '2642')
             and pk_group = '0001A110000000000MFL')
 
 
 select pk_billtypeid, pk_billtypecode, billtypename, pk_group
   from bd_billtype
  where pk_billtypecode in
        ('264X-Cxx-001', '264X-Cxx-002', '2641', '2647', '2642')
    and pk_group = '0001A110000000000MFL'
        
        select checkman,
               pk_org,
               substr(dealdate, 1, 10),
               pk_billtype,
               billno
          from pub_workflownote
        
        
        
        select distinct(djlxbm) from er_bxzb 
        
