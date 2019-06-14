--应收账龄明细表，合同与出库单关联关系vbdef20
select vbdef20
  from ic_saleout_b
 where cgeneralhid =
       (select cgeneralhid
          from ic_saleout_h
         where vbillcode = '82400XC20181108012')
for update 
