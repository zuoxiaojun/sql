
select pk_group,
fadinratecode,
       pk_debitorg,
       contractcode,
       contractamount,
       begindate,
       enddate,
       pk_creditorg
       --vdef9
  from cdm_contract --信贷合同
 where dr = '0'
union all
select pk_group,
vdef2, --融资品种
       pk_debitorg, --借款单位
       fundcontractcode, --合同编号
       contractamount, --合同金额
       begindate,
       enddate,
       pk_creditorg --贷款单位
--depositamount
  from cdm_fundfincon
 where dr = '0'




