
update  ar_gatherbill set dr=1 where billno ='80900SK18120033';

update ar_gatheritem
   set dr = 1
 where pk_gatherbill = (select pk_gatherbill
                          from ar_gatherbill
                         where billno = '80100SK18120258'
                           and dr = 1); --收款单
  --结算信息
 update cmp_settlement set dr = 1 where billcode = '80900SK18120033';

update cmp_detail
   set dr = '1'
 where pk_settlement =
       (select pk_settlement
          from cmp_settlement
         where billcode = '80100SK18120258' and dr =1)


