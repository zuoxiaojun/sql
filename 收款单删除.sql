
update  ar_gatherbill set dr=1 where billno ='81300SK18090011';

update ar_gatheritem
   set dr = 1
 where pk_gatherbill = (select pk_gatherbill
                          from ar_gatherbill
                         where billno = '81300SK18090011'
                           and dr = 0); --收款单
  --结算信息
 update cmp_settlement set dr = 1 where billcode = '81300SK18090011';

update cmp_detail
   set dr = '1'
 where pk_settlement =
       (select pk_settlement
          from cmp_settlement
         where billcode = '81300SK18090011' and dr =0)


