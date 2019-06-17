--应收账龄明细表，合同与出库单关联关系vbdef20
select vbdef20,norigtaxmny ,ntaxmny  
  from ic_saleout_b
 where cgeneralhid =
       (select cgeneralhid
          from ic_saleout_h
         where vbillcode = '81300XC20180407070')  --11360103.125 541476.00000000
for update 



select * from ic_saleout_b where vbdef20 ='~'
