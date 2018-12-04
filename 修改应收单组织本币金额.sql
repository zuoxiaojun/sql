select local_money_de, money_de,notax_de 
  from ar_recitem
 where pk_recbill =
       (select pk_recbill from ar_recbill where billno = '81300YS18110092')
   for update


--应付单行
select local_tax_cr, --税额
local_notax_cr, --组织本币无税金额 
notax_cr, --贷方原币无税金额 
local_money_cr, --组织本币金额
money_cr,  --贷方原币金额
money_bal ,--原币余额
local_money_bal --组织本币余额
  from ap_payableitem
 where pk_payablebill = (select pk_payablebill
                           from ap_payablebill
                          where billno = '80100YF18110213'
                            and dr = '0')
   for update
     
--应付单
select money, local_money
  from ap_payablebill
 where billno = '80100YF18110213'
   and dr = '0'
for update 



