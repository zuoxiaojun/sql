--应收单删掉修改人信息

select modifiedtime, modifier
  from ar_recbill
 where billno = '81600YS19040006'
for update 
