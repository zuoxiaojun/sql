
--���ݸ���Ų��Ҹ��������

select pk_subjcode,
       def26       "TR��Ʊ����",
       def27       "TR����֤���",
       def28       "TRƱ������",
       def30       "TRƱ�ݺ�"
  from ap_payitem
 where pk_paybill =
       (select pk_paybill from ap_paybill where billno = '81200FK18050016' and dr =0)
   --for update

update ap_payitem
   set def26 = 'Э�μ��ɿƼ��ɷ����޹�˾'
 where pk_paybill =
       (select pk_paybill from ap_paybill where billno = '81500FK18050069' and dr=0)
