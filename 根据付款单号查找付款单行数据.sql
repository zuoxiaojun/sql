
--根据付款单号查找付款单行数据

select pk_subjcode,
     def26,       --"TR收票客商",
       def27,       --"TR信用证编号",
       def28 ,      --"TR票据类型",
       def30      -- "TR票据号"
  from ap_payitem
 where pk_paybill =
       (select pk_paybill from ap_paybill where billno = '81500FK18060023' and dr =0)
  -- for update

