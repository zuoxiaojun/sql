create or replace view zjnd as
(
select d.pk_group,
       d.pk_org,
       d.pk_creditorg,
       d.dkname,
       d.contractcode,
       case d.contracttype
         when 'CONSIGNDEBIT' then
          '委托借款合同'
         when 'CONSIGNCREDIT' then
          '委托贷款合同'
       end contracttype,
       d.fadinratecode,
       d.pk_debitorg,
       d.rzname,
       d.pk_consignbank,
       d.enddate,
       d.begindate,
       d.pk_currtype,
       d.olcrate,
       d.contractamount,
       d.ratetype,
       d.remark,
       d.contractratecode
  from (select a.pk_group pk_group,
               a.pk_org pk_org,
               a.pk_creditorg pk_creditorg,
               b.name dkname,
               a.contractcode contractcode,
               a.contracttype contracttype,
               a.fadinratecode fadinratecode,
               a.pk_debitorg pk_debitorg,
               c.name rzname,
               a.pk_consignbank pk_consignbank,
               substr(a.enddate, 1, 10) enddate,
               substr(a.begindate, 1, 10) begindate,
               a.pk_currtype pk_currtype,
               a.olcrate olcrate,
               a.contractamount contractamount,
               a.ratetype ratetype,
               a.remark remark,
               a.contractratecode
          from cdm_contract a
          left join bd_customer b
            on (a.pk_creditorg = b.pk_customer)
          left join org_orgs c
            on (a.pk_debitorg = c. pk_org)
         where (a.contracttype = 'CONSIGNDEBIT')
           and (a.dr = 0)
            and (a.vbillstatus <>'5')--去掉作废态
        union all
        select a.pk_group pk_group,
               a.pk_org pk_org,
               a.pk_creditorg pk_creditorg,
               b.name dkname,
               a.contractcode contractcode,
               a.contracttype contracttype,
               a.fadinratecode fadinratecode,
               a.pk_debitorg pk_debitorg,
               c.name rzname,
               a.pk_consignbank pk_consignbank,
               substr(a.enddate, 1, 10) enddate,
               substr(a.begindate, 1, 10) begindate,
               a.pk_currtype pk_currtype,
               a.olcrate olcrate,
               a.contractamount contractamount,
               a.ratetype ratetype,
               a.remark remark,
               a.contractratecode
          from cdm_contract a
          left join org_orgs b
            on (a.pk_creditorg = b.pk_org)
          left join bd_customer c
            on (a.pk_debitorg = c. pk_customer)
         where (a.contracttype = 'CONSIGNCREDIT')
           and (a.dr = '0')
           and (a.vbillstatus <>'5')
                       ) d);
