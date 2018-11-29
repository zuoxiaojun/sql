create or replace view v_rzb_cdm_leasefincon as
(
select
*
  from (select
  '融资租赁' htclass,
  a.pk_group,
  a.issyndicatedloans, --银团牵头
               a.pk_org, --融资单位
               a.fundcontractcode, --融资合同号
               a.fadinratecode1, --融资品种           
               to_char(' ') bdzc,--标的资产
               b.pk_creditaggreement, --授信合同号
               a.vleasecomp ,-- 授信单位
               to_char(' ') sxjg, -- 授信机构
               a.ronzijgclass1, --机构类别
               a.creditcorpname fkjg, --放款机构
               a.enddate, --到期日
               a.begindate, --起始日
               a.pk_currtype, --融资币种
               a.olcrate, --汇率
               a.contractamount, --合同金额
               to_char(a.depositamount) bzj, --保证金
               b.creditquota, --合同敞口
               a.repayamount, --已还本金
               a.leftrepayamount, --未还本金
               (a.leftrepayamount - a.depositamount) whck, --未还敞口
               a.leftinterest, --未还息费
               a.olccontractmnt, --本币合同金额
               (a.contractamount - a.depositamount) * (a.olcrate) bbhtck, --本币合同敞口
               (a.leftrepayamount * a.olcrate) bbwhbj, --本币未还本金
               (a.leftrepayamount - a.depositamount) * a.olcrate bbwhck, --本币未还敞口
               a.leftinterest * a.olcrate bbwhxf, --本币未还息费
               (a.depositamount / a.contractamount) bzjl, --保证金率
               a.ratetype1, --利率类别
               a.vdef15, --IRR
               b.dr
          from cdm_leasefincon a --融资租赁
          left join cdm_leasecredred_b b
            on a.pk_leasefincon = b.pk_leasefincon

          where a.dr = '0'
         )
 where nvl(dr, 0) = '0' --存在a表有值，b表没值的情况，单独过滤一层b.dr
)
;
