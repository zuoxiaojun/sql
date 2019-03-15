
--银行编码长度不等于12位的银行档案
create or replace view v_bank_nolen_12 as 
select code, name, pk_bankdoc from bd_bankdoc where length(code) <> 12

select *  from v_bank_nolen_12


/*查询单据引用的银行账户*/
--select count(*) from cc_bankprotocol where dr=0

--企业授信协议
select '企业授信协议',
       protocolcode    vbillcode,
       pk_bankprotocol pk_bill,
       pk_creditbank   pk_bankdoc --银行
  from cc_bankprotocol
 where pk_creditbank in (select pk_bankdoc from v_bank_nolen_12)
   and dr = 0
   
--担保物权
select '担保物权管理',
       pledgeno       vbillcode,
       pk_guaproperty pk_bill,
       vdef4          pk_bankdoc --质权人（银行）
  from gpm_guaproperty
 where vdef4 in (select pk_bankdoc from v_bank_nolen_12)
   and dr = 0
   
--担保合同
select '担保合同',
       contractno     vbillcode,
       pk_guacontract pk_bill,
       creditorba     pk_bankdoc --债权人（银行）
  from gpm_guacontract
 where creditorba in (select pk_bankdoc from v_bank_nolen_12)
 
 
 
 --票据登记 
 select '票据登记-收款银行',
        fbmbillno          vbillcode,
        pk_register        pk_bill,
        hidereceivebank    pk_bankdoc --收款银行 
   from fbm_register
  where hidereceivebank in (select pk_bankdoc from v_bank_nolen_12)
    and dr = 0
 
 select '票据登记-付款银行',
        fbmbillno          vbillcode,
        pk_register        pk_bill,
        hidepaybank        pk_bankdoc --付款银行 
   from fbm_register
  where hidepaybank in (select pk_bankdoc from v_bank_nolen_12)
  and dr=0
 
 --银行托管，银行领用
 select '银行托管&&银行领用', 
         vbillno vbillcode, 
         pk_storage pk_bill, 
        pk_bankdoc --受托银行
   from fbm_storage
  where pk_bankdoc in (select pk_bankdoc from v_bank_nolen_12)
and dr = 0

--银行托收
select '银行托收',
       vbillno        vbillcode,
       pk_consignbank pk_bill,
       pk_holderbank  pk_bankdoc --托收银行
  from fbm_consignbank
 where pk_holderbank in (select pk_bankdoc from v_bank_nolen_12)

--贴现申请
select '贴现申请&&贴现办理',
       vbillno          vbillcode,
       pk_discount      pk_bill,
       pk_discount_bank pk_bankdoc --贴现银行
  from fbm_discount
 where pk_discount_bank in (select pk_bankdoc from v_bank_nolen_12)

--票据质押
select '票据质押', vbillno, pk_impawn, impawnbank --质押银行
  from fbm_impawn
 where impawnbank in (select pk_bankdoc from v_bank_nolen_12)

--开票申请
select '开票申请', vbillno, pk_sign_apply, signapplybank --开票银行
  from cfbm_sign_apply
 where signapplybank in (select pk_bankdoc from v_bank_nolen_12)

--票据签发-付款银行
select '票据签发-付款银行',
       fbmbillno          vbillcode,
       pk_register        pk_bill,
       hidepaybank --付款银行 
  from fbm_register
 where hidereceivebank in (select pk_bankdoc from v_bank_nolen_12)
   and dr = 0
   and hidepaybank <> '~'
   
 --票据签发-收款银行
 select '票据登记-收款银行',
        fbmbillno          vbillcode,
        pk_register        pk_bill,
        hidereceivebank --收款银行 
   from fbm_register
  where hidereceivebank in (select pk_bankdoc from v_bank_nolen_12)
    and dr = 0

--票据签发-授信银行
select '票据登记-授信银行',
       fbmbillno          vbillcode,
       pk_register        pk_bill,
       ccbank --授信银行 
  from fbm_register
 where hidereceivebank in (select pk_bankdoc from v_bank_nolen_12)
   and dr = 0
   and ccbank is not null
   and ccbank <> '~'

--票据付款
select '票据付款', vbillno, pk_accept, ccbank --授信银行
  from fbm_accept
 where ccbank in (select pk_bankdoc from v_bank_nolen_12)

--开证申请-开证行
select '开证申请-开证行', vbillno, pk_apply, pk_bank_issuing --开证行
  from lcm_apply
 where pk_bank_issuing in (select pk_bankdoc from v_bank_nolen_12)

--开证申请-付款银行
select '开证申请-付款银行', vbillno, pk_apply, pk_bank_nego --付款银行
  from lcm_apply
 where pk_bank_issuing in (select pk_bankdoc from v_bank_nolen_12)

--开证登记-开证行
select '开证登记-开证行', vbillno, pk_register, pk_bank_issuing --开证行
  from lcm_openregister
 where pk_bank_issuing in (select pk_bankdoc from v_bank_nolen_12)

--开证登记-付款银行
select '开证登记-付款银行', vbillno, pk_register, pk_bank_nego --付款银行 
  from lcm_openregister
 where pk_bank_nego in (select pk_bankdoc from v_bank_nolen_12)


--到单承付
select '到单承付', vbillno, pk_arrival, pk_openbank --开证行
  from lcm_arrival
 where pk_openbank in (select pk_bankdoc from v_bank_nolen_12)

--付款登记
/*   付款登记的开证行为引用字段，本单据无此字段
select '付款登记',
vbillno,
pk_payment 

 from lcm_payment*/
 
 --收证登记-通知行
 select '收证登记-通知行', vbillno, pk_receiptregister, pk_advisingbank --通知行
   from lcm_receiveregister
  where pk_advisingbank in (select pk_bankdoc from v_bank_nolen_12)
 
 --收证登记-收证行
 select '收证登记-通知行', vbillno, pk_receiptregister, pk_receivebank --收证行
   from lcm_receiveregister
  where pk_receivebank in (select pk_bankdoc from v_bank_nolen_12)

--收证登记-议付行
 select '收证登记-议付行', vbillno, pk_receiptregister, pk_negotiatedbank --议付行
   from lcm_receiveregister
  where pk_negotiatedbank in (select pk_bankdoc from v_bank_nolen_12)
  
--交单登记
select '交单登记', vbillno, pk_submissionregister, pk_receivebank --收单银行
  from lcm_submissionregister
 where pk_receivebank in (select pk_bankdoc from v_bank_nolen_12)
 
--通知收款
select '通知收款', vbillno, pk_collectionnotice, pk_receivebank
  from lcm_collectionnotice
 where pk_receivebank in (select pk_bankdoc from v_bank_nolen_12)
and dr=0

--银行贷款合同申请-贷款银行
select '银行贷款合同申请-贷款银行', applycode, pk_apply, pk_creditbank --贷款银行
  from cdm_apply
 where dr = 0
      --and applycode = '36FA18080059'
   and pk_creditbank in (select pk_bankdoc from v_bank_nolen_12)

--银行贷款合同申请-受托银行 
select '银行贷款合同申请-受托银行', applycode, pk_apply, pk_consignbank --受托银行
  from cdm_apply
 where dr = 0
   and pk_consignbank in (select pk_bankdoc from v_bank_nolen_12)

--银行贷款合同
select '银行贷款合同', contractcode, pk_contract, pk_creditbank --贷款银行 
  from cdm_contract
 where pk_creditbank in (select pk_bankdoc from v_bank_nolen_12)


--贷款合同申请子表
select '贷款合同申请子表', PK_CONTRACT, PK_CREDITDEDUCTION, PK_BANK --授信银行
  from cdm_creditReduce
 where PK_BANK in (select pk_bankdoc from v_bank_nolen_12)


--
select * from cdm_payrcpt where vbillno ='36FE17050004'

