create or replace view v_htcl as
( select a.pk_group,
             a.pk_org,
             a.pk_creditorg,
             a.dkname,
             a.contractcode,
             a.contracttype,
             a.fadinratecode,
             a.pk_debitorg,
             a.rzname,
             a.pk_consignbank,
             a.enddate,
             a.begindate,
             a.pk_currtype,
             a.olcrate,
             a.contractamount,
             a.ratetype,
             a.remark,
             a.contractratecode,--合同利率表体PK
             b.pk_contractrate --合同利率表头PK
        from zjnd a
        left join tmpub_contractrate_b b
          on a.contractratecode = b.pk_contractrate_b)
;
