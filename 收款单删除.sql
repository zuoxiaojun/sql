


update  ar_gatherbill set dr=1 where billno ='80200SK18060005';

update ar_gatheritem
   set dr = 1
 where pk_gatherbill = (select pk_gatherbill
                          from ar_gatherbill
                         where billno = '80200SK18060005')  --收款单
                         
  
  --结算信息
  update cmp_settlement set dr = 0 where billcode = '80200SK18060005';

update cmp_detail
   set dr = '0'
 where pk_settlement =
       (select pk_settlement
          from cmp_settlement
         where billcode = '80200SK18060005')
