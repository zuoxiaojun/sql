create or replace view v_rzb_cdm_contract as
select
*
  from (select
               '银行贷款合同' htclass,
               a.pk_group,
               a.issyndicatedloans, --银团牵头
               a.pk_org, --融资单位
               a.contractcode, --融资合同号
               a.fadinratecode, --融资品种
               to_char('') bdzc,--标的资产
               b.pk_creditaggreement, -- 授信合同号
               b.def3, -- 授信单位(客户)
               b.def2, --授信机构（银行）
               a.ronzijgclass1, --机构类别
               a.creditcorpname, --放款机构
               a.enddate, --到期日
               a.begindate, --起始日
               a.pk_currtype, --融资币种
               a.olcrate, --汇率
               a.contractamount, --合同金额
               to_char(a.vdef9) bzj, --保证金
               b.creditquota, --合同敞口
               a.repayamount, --已还本金
               a.leftrepayamount, --未还本金
               to_number(a.leftrepayamount) - to_number(decode(a.vdef9, '~', '0')) whck,--未还敞口
               a.leftinterest, --未还息费
               a.olccontractmnt, --本币合同金额
               (to_number(a.contractamount) - to_number(decode(a.vdef9, '~', '0'))) *olcrate  bbhtck,  --本币合同敞口
               a.leftrepayamount*a.olcrate   bbwhbj,  --本币未还本金
               (a.leftrepayamount-to_number(decode(a.vdef9, '~', '0')))*olcrate  bbwhck,    --本币未还敞口
               leftinterest*olcrate bbwhxf ,  --本币未还息费
               ((to_number(decode(vdef9, '~', '0'))) / (contractamount))  bzjl, --保证金率
               a.ratetype, --利率类别
               a.vdef15, --IRR
               b.dr
          from cdm_contract a   --融资表-银行贷款合同
          left join cdm_creditReduce b
            on a. pk_contract = b. pk_contract
         where a.contracttype = 'BANKCREDIT'
           and a.dr = '0')
/*存在a表有值，b表没值的情况，单独过滤一层b.dr*/
 where nvl(dr, 0) = '0'
;
