
--���ݸ���Ų��Ҹ��������

select pk_subjcode,
     def26,       --"TR��Ʊ����",
       def27,       --"TR����֤���",
       def28 ,      --"TRƱ������",
       def30      -- "TRƱ�ݺ�"
  from ap_payitem
 where pk_paybill =
       (select pk_paybill from ap_paybill where billno = '81500FK18060023' and dr =0)
  -- for update

