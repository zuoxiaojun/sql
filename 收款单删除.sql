--收款单删除
update  ar_gatherbill set dr=1 where billno ='80100SK19060112';

update ar_gatheritem
   set dr = 1
 where pk_gatherbill = (select pk_gatherbill
                          from ar_gatherbill
                         where billno = '80100SK19060112'
                           and dr = 1); --收款单
                                                  
   --付款单删除
   update ap_paybill set dr = 1 where billno='80100FK19040123'
   
   update ap_payitem set dr= 1 where  billno='80100FK19040123'                       
                             
   
   
  --结算信息
 update cmp_settlement set dr = 1 where billcode = '80100SK19060112';

update cmp_detail
   set dr = '1'
 where pk_settlement =
       (select pk_settlement
          from cmp_settlement
         where billcode = '80100SK19060112' and dr =1)


