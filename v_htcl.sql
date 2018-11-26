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
             a.contractratecode,--��ͬ���ʱ���PK
             b.pk_contractrate --��ͬ���ʱ�ͷPK
        from zjnd a
        left join tmpub_contractrate_b b
          on a.contractratecode = b.pk_contractrate_b)
;
