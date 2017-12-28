--应付单取凭证号
getcolvalue(gl_voucher,num,pk_voucher,getcolvalue(fip_relation,des_relationid,src_relationid,pk_payablebill))

select num
  from gl_voucher
 where pk_voucher = (select des_relationid
                       from fip_relation
                      where src_relationid = '1001D1100000007DOUR0');

select pk_recbill from ar_recbill where billno = '80100YS17110002'
