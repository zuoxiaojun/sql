
--修改销售出库单表体价税合计
select norigtaxmny
  from ic_saleout_b
 where cgeneralhid =
       (select cgeneralhid
          from ic_saleout_h
         where vbillcode = '81300XC20180707029')
   for update

     select a.pk_org,
            a.vbillcode,
            a.dbilldate,
            b.cdeliverybid,
            b.nitemdiscountrate,
            b.ndiscountrate,
            b.norigtaxprice,
            b.nnum,
            b.norigtaxmny,
            b.nqtorigtaxprice * b.nnum "je"
       from so_delivery a
       left join so_delivery_b b
         on a.cdeliveryid = b.cdeliveryid
      where a.dr = 0
        and b.dr = 0
        and round(b.norigtaxprice * b.nnum, 0) <> round(norigtaxmny, 0)
        
        
       
