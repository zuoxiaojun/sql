
--付款单与付款申请关联

--先找一条关联对照数据
 select CONTRACTNO,
        TOP_BILLID,
        TOP_BILLTYPE,
        TOP_ITEMID
   from ap_payitem
  where billno = '83300FK19040014'
    and dr = 0 
    
--1	vodafone 2018 December	1001D110000000H217Y2	36D1	1001D110000000H217Y3	~	7.53000000

select CONTRACTNO,
       TOP_BILLID,
       TOP_BILLTYPE,
       TOP_ITEMID,
       --构成关联的字段
       dr
  from ap_payitem
 where billno = '83300FK19040013'
   and dr = 0
   for update
     ;
   
   
