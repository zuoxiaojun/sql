SELECT t_1.billmaker   billmaker,
       t_1.org         org,
       t_1.billdate    billdate,
       t_1.tradetypeid tradetypeid,
       t_1.num         num
  FROM ((SELECT *
           FROM (SELECT ap_paybill.billmaker billmaker,
                        ap_paybill.pk_org org,
                        substr(ap_paybill.billdate, 1, 10) billdate,
                        ap_paybill.pk_tradetypeid tradetypeid,
                        count(ap_paybill.pk_paybill) num
                   FROM ap_paybill ap_paybill
                  WHERE ap_paybill.dr = 0
                  GROUP BY ap_paybill.billmaker,
                           ap_paybill.pk_org,
                           substr(ap_paybill.billdate, 1, 10),
                           ap_paybill.pk_tradetypeid)) UNION ALL
        (SELECT *
           FROM (SELECT ap_payablebill.billmaker billmaker,
                        ap_payablebill.pk_org org,
                        substr(ap_payablebill.billdate, 1, 10) billdate,
                        ap_payablebill.pk_tradetypeid tradetypeid,
                        count(ap_payablebill.pk_payablebill) num
                   FROM ap_payablebill ap_payablebill
                  WHERE ap_payablebill.dr = 0
                  GROUP BY ap_payablebill.billmaker,
                           ap_payablebill.pk_org,
                           substr(ap_payablebill.billdate, 1, 10),
                           ap_payablebill.pk_tradetypeid)) UNION ALL
        (SELECT *
           FROM (SELECT er_bxzb.operator billmaker,
                        er_bxzb.pk_fiorg org,
                        substr(er_bxzb.djrq, 1, 10) billdate,
                        bd_billtype.pk_billtypeid pk_billtypeid,
                        count(distinct er_bxzb.pk_jkbx) num
                   FROM er_bxzb er_bxzb
                   LEFT JOIN bd_billtype bd_billtype
                     ON (er_bxzb.djlxbm = bd_billtype.pk_billtypecode)
                  WHERE er_bxzb.dr = 0
                    AND bd_billtype.pk_group = '0001A110000000000MFL'
                  GROUP BY er_bxzb.operator,
                           er_bxzb.pk_fiorg,
                           substr(er_bxzb.djrq, 1, 10),
                           bd_billtype.pk_billtypeid,
                           bd_billtype.pk_group) t_1) UNION ALL
        (SELECT *
           FROM (SELECT ar_recbill.billmaker billmaker,
                        ar_recbill.pk_org org,
                        substr(ar_recbill.billdate, 1, 10) billdate,
                        ar_recbill.pk_tradetypeid tradetypeid,
                        count(ar_recbill.pk_recbill) num
                   FROM ar_recbill ar_recbill
                  WHERE ar_recbill.dr = 0
                  GROUP BY ar_recbill.billmaker,
                           ar_recbill.pk_org,
                           substr(ar_recbill.billdate, 1, 10),
                           ar_recbill.pk_tradetypeid)) UNION ALL
        (SELECT *
           FROM (SELECT ar_gatherbill.billmaker billmaker,
                        ar_gatherbill.pk_org org,
                        substr(ar_gatherbill.billdate, 1, 10) billdate,
                        ar_gatherbill.pk_tradetypeid tradetypeid,
                        count(ar_gatherbill.pk_gatherbill) num
                   FROM ar_gatherbill ar_gatherbill
                  WHERE ar_gatherbill.dr = 0
                  GROUP BY ar_gatherbill.billmaker,
                           ar_gatherbill.pk_org,
                           substr(ar_gatherbill.billdate, 1, 10),
                           ar_gatherbill.pk_tradetypeid)) UNION ALL
        (SELECT *
           FROM (SELECT so_saleinvoice.billmaker billmaker,
                        so_saleinvoice.pk_org org,
                        substr(so_saleinvoice.dbilldate, 1, 10) dbilldate,
                        so_saleinvoice.ctrantypeid ctrantypeid,
                        count(so_saleinvoice.csaleinvoiceid) num
                   FROM so_saleinvoice so_saleinvoice
                  WHERE so_saleinvoice.dr = 0
                  GROUP BY so_saleinvoice.billmaker,
                           so_saleinvoice.pk_org,
                           substr(so_saleinvoice.dbilldate, 1, 10),
                           so_saleinvoice.ctrantypeid)) UNION ALL
        (SELECT *
           FROM (SELECT er_jkzb.operator billmaker,
                        er_jkzb.pk_fiorg org,
                        substr(er_jkzb.djrq, 1, 10) billdate,
                        bd_billtype.pk_billtypeid pk_billtypeid,
                        count(er_jkzb.pk_jkbx) num
                   FROM er_jkzb er_jkzb
                   LEFT JOIN bd_billtype bd_billtype
                     ON (er_jkzb.djlxbm = bd_billtype.pk_billtypecode)
                  WHERE er_jkzb.dr = 0
                  GROUP BY er_jkzb.operator,
                           er_jkzb.pk_fiorg,
                           substr(er_jkzb.djrq, 1, 10),
                           bd_billtype.pk_billtypeid)) UNION ALL
        (SELECT *
           FROM (SELECT po_invoice.billmaker billmaker,
                        po_invoice.pk_org org,
                        substr(po_invoice.dmakedate, 1, 10) dmakedate,
                        po_invoice.ctrantypeid ctrantypeid,
                        count(po_invoice.pk_invoice) num
                   FROM po_invoice po_invoice
                  WHERE po_invoice.dr = 0
                  GROUP BY po_invoice.billmaker,
                           po_invoice.pk_org,
                           substr(po_invoice.dmakedate, 1, 10),
                           po_invoice.ctrantypeid)) UNION ALL
        (SELECT *
           FROM (SELECT cmp_paybill.billmaker billmaker,
                        cmp_paybill.pk_org pk_org,
                        substr(cmp_paybill.bill_date, 1, 10) bill_date,
                        cmp_paybill.pk_tradetypeid pk_tradetypeid,
                        count(cmp_paybill.pk_paybill) num
                   FROM cmp_paybill cmp_paybill
                  WHERE cmp_paybill.dr = 0
                  GROUP BY cmp_paybill.billmaker,
                           cmp_paybill.pk_org,
                           substr(cmp_paybill.bill_date, 1, 10),
                           cmp_paybill.pk_tradetypeid)) UNION ALL
        (SELECT *
           FROM (SELECT cmp_recbill.billmaker billmaker,
                        cmp_recbill.pk_org pk_org,
                        substr(cmp_recbill.bill_date, 1, 10) bill_date,
                        cmp_recbill.pk_tradetypeid pk_tradetypeid,
                        count(cmp_recbill.pk_recbill) num
                   FROM cmp_recbill cmp_recbill
                  WHERE cmp_recbill.dr = 0
                  GROUP BY cmp_recbill.billmaker,
                           cmp_recbill.pk_org,
                           substr(cmp_recbill.bill_date, 1, 10),
                           cmp_recbill.pk_tradetypeid)) UNION ALL
        (SELECT *
           FROM (SELECT cmp_transformbill.billmaker billmaker,
                        cmp_transformbill.pk_org pk_org,
                        substr(cmp_transformbill.billdate, 1, 10) billdate,
                        cmp_transformbill.pk_billtypeid pk_billtypeid,
                        count(cmp_transformbill.pk_transformbill) num
                   FROM cmp_transformbill cmp_transformbill
                  WHERE cmp_transformbill.dr = 0
                  GROUP BY cmp_transformbill.billmaker,
                           cmp_transformbill.pk_org,
                           substr(cmp_transformbill.billdate, 1, 10),
                           cmp_transformbill.pk_billtypeid)) UNION ALL
        (SELECT *
           FROM (SELECT fa_alter.billmaker billmaker,
                        fa_alter.pk_org pk_org,
                        substr(fa_alter.business_date, 1, 10) business_date,
                        fa_alter.pk_transitype pk_transitype,
                        count(fa_alter.pk_alter) num
                   FROM fa_alter fa_alter
                  WHERE fa_alter.dr = 0
                  GROUP BY fa_alter.billmaker,
                           fa_alter.pk_org,
                           substr(fa_alter.business_date, 1, 10),
                           fa_alter.pk_transitype)) UNION ALL
        (SELECT *
           FROM (SELECT fa_deployout.billmaker billmaker,
                        fa_deployout.pk_org pk_org,
                        substr(fa_deployout.billmaketime, 1, 10) billmaketime,
                        fa_deployout.pk_transitype pk_transitype,
                        count(fa_deployout.pk_deployout) num
                   FROM fa_deployout fa_deployout
                  WHERE fa_deployout.dr = 0
                  GROUP BY fa_deployout.billmaker,
                           fa_deployout.pk_org,
                           substr(fa_deployout.billmaketime, 1, 10),
                           fa_deployout.pk_transitype)) UNION ALL
        (SELECT *
           FROM (SELECT fa_deployin.billmaker billmaker,
                        fa_deployin.pk_org pk_org,
                        substr(fa_deployin.billmaketime, 1, 10) billmaketime,
                        fa_deployin.pk_transitype pk_transitype,
                        count(fa_deployin.pk_deployin) num
                   FROM fa_deployin fa_deployin
                  WHERE fa_deployin.dr = 0
                  GROUP BY fa_deployin.billmaker,
                           fa_deployin.pk_org,
                           substr(fa_deployin.billmaketime, 1, 10),
                           fa_deployin.pk_transitype)) UNION ALL
        (SELECT *
           FROM (SELECT fa_predevaluate.billmaker billmaker,
                        fa_predevaluate.pk_org pk_org,
                        substr(fa_predevaluate.business_date, 1, 10) business_date,
                        fa_predevaluate.pk_transitype pk_transitype,
                        count(fa_predevaluate.pk_predevaluate) num
                   FROM fa_predevaluate fa_predevaluate
                  WHERE fa_predevaluate.dr = 0
                  GROUP BY fa_predevaluate.billmaker,
                           fa_predevaluate.pk_org,
                           substr(fa_predevaluate.business_date, 1, 10),
                           fa_predevaluate.pk_transitype)) UNION ALL
        (SELECT *
           FROM (SELECT fa_assetsplit.billmaker billmaker,
                        fa_assetsplit.pk_org pk_org,
                        substr(fa_assetsplit.business_date, 1, 10) business_date,
                        fa_assetsplit.pk_transitype pk_transitype,
                        count(fa_assetsplit.pk_assetsplit) num
                   FROM fa_assetsplit fa_assetsplit
                  WHERE fa_assetsplit.dr = 0
                  GROUP BY fa_assetsplit.billmaker,
                           fa_assetsplit.pk_org,
                           substr(fa_assetsplit.business_date, 1, 10),
                           fa_assetsplit.pk_transitype)) UNION ALL
        (SELECT *
           FROM (SELECT fa_assetcombin.billmaker billmaker,
                        fa_assetcombin.pk_org pk_org,
                        substr(fa_assetcombin.billmaketime, 1, 10) billmaketime,
                        fa_assetcombin.pk_transitype pk_transitype,
                        count(fa_assetcombin.pk_assetcombin) num
                   FROM fa_assetcombin fa_assetcombin
                  WHERE fa_assetcombin.dr = 0
                  GROUP BY fa_assetcombin.billmaker,
                           fa_assetcombin.pk_org,
                           substr(fa_assetcombin.billmaketime, 1, 10),
                           fa_assetcombin.pk_transitype)) UNION ALL
        (SELECT *
           FROM (SELECT fa_reduce.billmaker billmaker,
                        fa_reduce.pk_org pk_org,
                        substr(fa_reduce.billmaketime, 1, 10) billmaketime,
                        fa_reduce.pk_transitype pk_transitype,
                        count(fa_reduce.pk_reduce) num
                   FROM fa_reduce fa_reduce
                  GROUP BY fa_reduce.billmaker,
                           fa_reduce.pk_org,
                           substr(fa_reduce.billmaketime, 1, 10),
                           fa_reduce.pk_transitype)) UNION ALL
        (SELECT *
           FROM (SELECT pub_workflownote.checkman checkman,
                        pub_workflownote.pk_org pk_org,
                        substr(pub_workflownote.dealdate, 1, 10) dealdate,
                        bd_billtype.pk_billtypeid pk_billtypeid,
                        count(pub_workflownote.pk_checkflow) num
                   FROM pub_workflownote pub_workflownote
                   LEFT JOIN bd_billtype bd_billtype
                     ON (bd_billtype.pk_billtypecode =
                        pub_workflownote.pk_billtype AND
                        bd_billtype.pk_group = '0001A110000000000MFL')
                  GROUP BY pub_workflownote.checkman,
                           pub_workflownote.pk_org,
                           substr(pub_workflownote.dealdate, 1, 10),
                           bd_billtype.pk_billtypeid)) UNION ALL
        (SELECT *
           FROM (SELECT cdm_contract_v.billmaker billmaker,
                        cdm_contract_v.pk_org pk_org,
                        substr(cdm_contract_v.billmakedate, 1, 10) billmakedate,
                        cdm_contract_v.pk_billtypeid pk_billtypeid,
                        count(cdm_contract_v.pk_contract) num
                   FROM cdm_contract_v cdm_contract_v
                  WHERE cdm_contract_v.dr = 0
                  GROUP BY cdm_contract_v.billmaker,
                           cdm_contract_v.pk_org,
                           substr(cdm_contract_v.billmakedate, 1, 10),
                           cdm_contract_v.pk_billtypeid)) UNION ALL
        (SELECT *
           FROM (SELECT cdm_apply.billmaker billmaker,
                        cdm_apply.pk_org pk_org,
                        substr(cdm_apply.billmakedate, 1, 10) billmakedate,
                        cdm_apply.pk_billtypeid pk_billtypeid,
                        count(cdm_apply.pk_apply) num
                   FROM cdm_apply cdm_apply
                  WHERE cdm_apply.dr = 0
                  GROUP BY cdm_apply.billmaker,
                           cdm_apply.pk_org,
                           substr(cdm_apply.billmakedate, 1, 10),
                           cdm_apply.pk_billtypeid)) UNION ALL
        (SELECT *
           FROM (SELECT fbm_register.billmaker billmaker,
                        fbm_register.pk_org pk_org,
                        substr(fbm_register.doperatedate, 1, 10) doperatedate,
                        bd_billtype.pk_billtypeid pk_billtypeid,
                        count(fbm_register.pk_register) num
                   FROM fbm_register fbm_register
                   LEFT JOIN bd_billtype bd_billtype
                     ON (fbm_register.pk_billtypecode =
                        bd_billtype.pk_billtypecode)
                  WHERE fbm_register.dr = 0
                  GROUP BY fbm_register.billmaker,
                           fbm_register.pk_org,
                           substr(fbm_register.doperatedate, 1, 10),
                           bd_billtype.pk_billtypeid)) UNION ALL
        (SELECT *
           FROM (SELECT fbm_discount.billmaker billmaker,
                        fbm_discount.pk_org pk_org,
                        substr(fbm_discount.doperatedate, 1, 10) doperatedate,
                        fbm_discount.pk_billtypeid pk_billtypeid,
                        count(fbm_discount.pk_discount) num
                   FROM fbm_discount fbm_discount
                  WHERE fbm_discount.dr = 0
                  GROUP BY fbm_discount.billmaker,
                           fbm_discount.pk_org,
                           substr(fbm_discount.doperatedate, 1, 10),
                           fbm_discount.pk_billtypeid)) UNION ALL
        (SELECT *
           FROM (SELECT fbm_rreturn.billmaker billmaker,
                        fbm_rreturn.pk_org pk_org,
                        substr(fbm_rreturn.doperatedate, 1, 10) doperatedate,
                        fbm_rreturn.pk_billtypeid pk_billtypeid,
                        count(fbm_rreturn.pk_rreturn) num
                   FROM fbm_rreturn fbm_rreturn
                  WHERE fbm_rreturn.dr = 0
                  GROUP BY fbm_rreturn.billmaker,
                           fbm_rreturn.pk_org,
                           substr(fbm_rreturn.doperatedate, 1, 10),
                           fbm_rreturn.pk_billtypeid)) UNION ALL
        (SELECT *
           FROM (SELECT fbm_accept.billmaker billmaker,
                        fbm_accept.pk_org pk_org,
                        substr(fbm_accept.doperatedate, 1, 10) doperatedate,
                        (CASE fbm_accept.pk_billtypeid
                          WHEN '~' THEN
                           '36HDZ600000000000000'
                          ELSE
                           '36HDZ600000000000000'
                        END) pk_billtypeid,
                        count(fbm_accept.pk_accept) num
                   FROM fbm_accept fbm_accept
                  WHERE fbm_accept.dr = 0
                  GROUP BY fbm_accept.billmaker,
                           fbm_accept.pk_org,
                           substr(fbm_accept.doperatedate, 1, 10),
                           CASE fbm_accept.pk_billtypeid
                             WHEN '~' THEN
                              '36HDZ600000000000000'
                             ELSE
                              '36HDZ600000000000000'
                           END)) UNION ALL
        (SELECT *
           FROM (SELECT fbm_preturn.billmaker billmaker,
                        fbm_preturn.pk_org pk_org,
                        substr(fbm_preturn.doperatedate, 1, 10) doperatedate,
                        fbm_preturn.pk_billtypeid pk_billtypeid,
                        count(fbm_preturn.pk_preturn) num
                   FROM fbm_preturn fbm_preturn
                  WHERE fbm_preturn.dr = 0
                  GROUP BY fbm_preturn.billmaker,
                           fbm_preturn.pk_org,
                           substr(fbm_preturn.doperatedate, 1, 10),
                           fbm_preturn.pk_billtypeid)) UNION ALL
        (SELECT *
           FROM (SELECT fbm_consignbank.billmaker billmaker,
                        fbm_consignbank.pk_org pk_org,
                        substr(fbm_consignbank.doperatedate, 1, 10) doperatedate,
                        bd_billtype.pk_billtypeid pk_billtypeid,
                        count(fbm_consignbank.pk_consignbank) num
                   FROM fbm_consignbank fbm_consignbank
                   LEFT JOIN bd_billtype bd_billtype
                     ON (fbm_consignbank.pk_billtypecode =
                        bd_billtype.pk_billtypecode)
                  WHERE fbm_consignbank.dr = 0
                  GROUP BY fbm_consignbank.billmaker,
                           fbm_consignbank.pk_org,
                           substr(fbm_consignbank.doperatedate, 1, 10),
                           bd_billtype.pk_billtypeid)) UNION ALL
        (SELECT *
           FROM (SELECT fbm_impawn.billmaker billmaker,
                        fbm_impawn.pk_org pk_org,
                        substr(fbm_impawn.doperatedate, 1, 10) doperatedate,
                        fbm_impawn.pk_billtypeid pk_billtypeid,
                        count(fbm_impawn.pk_impawn) num
                   FROM fbm_impawn fbm_impawn
                  WHERE fbm_impawn.dr = 0
                  GROUP BY fbm_impawn.billmaker,
                           fbm_impawn.pk_org,
                           substr(fbm_impawn.doperatedate, 1, 10),
                           fbm_impawn.pk_billtypeid)) UNION ALL
        (SELECT *
           FROM (SELECT cdm_payrcpt.billmaker billmaker,
                        cdm_payrcpt.pk_org pk_org,
                        substr(cdm_payrcpt.billmakedate, 1, 10) billmakedate,
                        bd_billtype.pk_billtypeid pk_billtypeid,
                        count(cdm_payrcpt.pk_payrcpt) num
                   FROM cdm_payrcpt cdm_payrcpt
                   LEFT JOIN bd_billtype bd_billtype
                     ON (cdm_payrcpt.pk_billtypecode =
                        bd_billtype.pk_billtypecode)
                  WHERE cdm_payrcpt.dr = 0
                  GROUP BY cdm_payrcpt.billmaker,
                           cdm_payrcpt.pk_org,
                           substr(cdm_payrcpt.billmakedate, 1, 10),
                           bd_billtype.pk_billtypeid)) UNION ALL
        (SELECT *
           FROM (SELECT cdm_repayrcpt.billmaker billmaker,
                        cdm_repayrcpt.pk_org pk_org,
                        substr(cdm_repayrcpt.billmakedate, 1, 10) billmakedate,
                        cdm_repayrcpt.pk_billtypeid pk_billtypeid,
                        count(cdm_repayrcpt.pk_repayrcpt) num
                   FROM cdm_repayrcpt cdm_repayrcpt
                  WHERE cdm_repayrcpt.dr = 0
                  GROUP BY cdm_repayrcpt.billmaker,
                           cdm_repayrcpt.pk_org,
                           substr(cdm_repayrcpt.billmakedate, 1, 10),
                           cdm_repayrcpt.pk_billtypeid)) UNION ALL
        (SELECT *
           FROM (SELECT cdm_contiabill.vvoucherid vvoucherid,
                        cdm_contiabill.pk_org pk_org,
                        substr(cdm_contiabill.billmakedate, 1, 10) billmakedate,
                        bd_billtype.pk_billtypeid pk_billtypeid,
                        count(cdm_contiabill.pk_iabill) num
                   FROM cdm_contiabill cdm_contiabill
                   LEFT JOIN bd_billtype bd_billtype
                     ON (cdm_contiabill.pk_billtypecode =
                        bd_billtype.pk_billtypecode)
                  WHERE cdm_contiabill.dr = 0
                  GROUP BY cdm_contiabill.vvoucherid,
                           cdm_contiabill.pk_org,
                           substr(cdm_contiabill.billmakedate, 1, 10),
                           bd_billtype.pk_billtypeid))) t_1
 WHERE (t_1.billmaker IN
       (SELECT cuserid cuserid
           FROM sm_user
          WHERE user_code IN (SELECT bd_psndoc.code code
                                FROM bd_psndoc bd_psndoc
                                LEFT JOIN org_adminorg meta
                                  ON bd_psndoc.pk_org = meta.pk_adminorg
                               WHERE meta.code = '821')))
   AND (t_1.tradetypeid <> '~')
