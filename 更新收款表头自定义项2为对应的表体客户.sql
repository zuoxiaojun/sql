select def2 from ar_gatherbill where billno ='80100SK18050128'

select billno,def2 from ar_gatherbill where def2 ='~'
--资金接口数据传输表头对应客户丢失
--更新收款表头自定义项2为对应的表体客户

UPDATE ar_gatherbill A
   SET A . def2 =
       (SELECT distinct(b. customer)
          FROM ar_gatheritem b
         WHERE A.pk_gatherbill = b.pk_gatherbill)
 WHERE EXISTS (SELECT 1
          FROM ar_gatheritem b
         WHERE A.pk_gatherbill = b.pk_gatherbill)
   and a.def2 = '~'
