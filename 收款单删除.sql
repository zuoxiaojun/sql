


update  ar_gatherbill set dr=1 where billno ='81500SK18060004';

update ar_gatheritem
   set dr = 1
 where pk_gatherbill = (select pk_gatherbill
                          from ar_gatherbill
                         where billno = '81500SK18060004')  --�տ
                         
  
  --������Ϣ
  update cmp_settlement set dr = 0 where billcode = '81500SK18060004';

update cmp_detail
   set dr = '0'
 where pk_settlement =
       (select pk_settlement
          from cmp_settlement
         where billcode = '81500SK18060004')
