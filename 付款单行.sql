select def30,checkno from ar_gatheritem order by ts desc for update  --收款单行

select dr, pk_gatherbill
  from ar_gatherbill
 where billno = '80900SK18050001'
   for update; --收款单主表
   
select dr
  from ar_gatheritem
 where pk_gatherbill = '1001D110000000AD7S29'
   for update --收款单子表
