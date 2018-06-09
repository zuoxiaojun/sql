select src_syscode,dr from ar_gatherbill where billno ='80100SK18050281' for update 


update  ar_gatherbill set dr=1 where billno ='80100SK18050281';

update ar_gatheritem
   set dr = 1
 where pk_gatherbill = (select pk_gatherbill
                          from ar_gatherbill
                         where billno = '80100SK18050281')

