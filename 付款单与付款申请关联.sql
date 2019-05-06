
--付款单与付款申请关联

--先找一条关联对照数据
 select CONTRACTNO,
        TOP_BILLID,
        TOP_BILLTYPE,
        TOP_ITEMID,
        TOP_TERMCH,
        local_money_de
   from ap_payitem
  where billno = '80100FK19040123'
    and dr = 0 
    
1 GCL/XMBU-QT-2017-0216号  1001D110000000FGI9MH  36D1  1001D110000000FGI9MI  1001B110000000016MIS  2387.84000000
2 -                        1001D110000000E3KIUJ  36D1  1001D110000000E3KIUK  1001D110000000E3KISU  1677.50000000





select CONTRACTNO,
       TOP_BILLID,
       TOP_BILLTYPE,
       TOP_ITEMID,
       TOP_TERMCH,
       local_money_de, --构成关联的字段
       dr
  from ap_payitem
 where billno = '80100FK19040159'
   and dr = 0
   for update
     ;
   
   
