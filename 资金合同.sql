
select pk_group,
fadinratecode,
       pk_debitorg,
       contractcode,
       contractamount,
       begindate,
       enddate,
       pk_creditorg
       --vdef9
  from cdm_contract --�Ŵ���ͬ
 where dr = '0'
union all
select pk_group,
vdef2, --����Ʒ��
       pk_debitorg, --��λ
       fundcontractcode, --��ͬ���
       contractamount, --��ͬ���
       begindate,
       enddate,
       pk_creditorg --���λ
--depositamount
  from cdm_fundfincon
 where dr = '0'




