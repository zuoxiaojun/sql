--销售收款单交易类型相关字段
select pk_billtype, pk_tradetype, pk_tradetypeid, billclass
  from ar_gatherbill
 where billno = '83300SK18110001'
