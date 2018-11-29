--模块汇总视图
create or replace view v_rzb_all as (
select * from v_rzb_cdm_contract  --融资表-银行贷款合同
union all
select * from v_rzb_cdm_leasefincon --融资表-融资租赁
union all 
select * from v_rzb_cdm_fundfincon --融资表-基金
union all
select * from v_rzb_cdm_xtcontract  --融资表-信托
union all 
select * from v_rzb_cdm_deptassfincon_h  )--融资表-发债


select * from v_rzb_all

--融资表
select htclass, --合同大类
       a.pk_group,
       a.issyndicatedloans, --银团牵头
       a.pk_org, --融资单位
       a.contractcode, --融资合同号
       b.name, --融资品种
       a.bdzc, --标的资产
       a.pk_creditaggreement, -- 授信合同号
       a.def3, -- 授信单位(客户)
       a.def2, --授信机构（银行）
       a.ronzijgclass1, --机构类别
       a.creditcorpname, --放款机构
       a.enddate, --到期日
       a.begindate, --起始日
       a.pk_currtype, --融资币种
       a.olcrate, --汇率
       a.contractamount, --合同金额
       a. bzj, --保证金
       a.creditquota, --合同敞口
       a.repayamount, --已还本金
       a.leftrepayamount, --未还本金
       a.whck, --未还敞口
       a.leftinterest, --未还息费
       a.olccontractmnt, --本币合同金额
       a.bbhtck, --本币合同敞口
       a.bbwhbj, --本币未还本金
       a.bbwhck, --本币未还敞口
       a.bbwhxf, --本币未还息费
       a.bzjl, --保证金率
       a.ratetype, --利率类别
       a.vdef15 --IRR
  from v_rzb_all a
  left join bd_defdoc b
    on a.fadinratecode = b.pk_defdoc




