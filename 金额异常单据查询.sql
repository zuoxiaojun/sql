--����������쳣
select a.pk_org,
       a.vbillcode,
       a.caccountperiod,
       b.nprice,
       b.nnum,
       b.nmny,
       round(b.nprice * b.nnum, 2) "je"
  from ia_iibill a
  left join ia_iibill_b b
    on a.cbillid = b.cbillid
 where a.dr = 0
   and b.dr = 0
      --and a.vbillcode='80100II2018030211'
   and round(b.nprice * b.nnum, 2) <> b.nmny
   and a.caccountperiod = '2018-07'
   and abs(b.nmny - (round(b.nprice * b.nnum, 2))) > 500
   
--�������ⵥ����쳣
select a.pk_org,
       a.vbillcode,
       a.caccountperiod,
       b.nprice,
       b.nnum,
       b.nmny,
       round(b.nprice * b.nnum, 2) "je"
  from ia_ijbill a
  left join ia_ijbill_b b
    on a.cbillid = b.cbillid
 where a.dr = 0
   and b.dr = 0
   and round(b.nprice * b.nnum, 2) <> b.nmny
   and a.caccountperiod='2018-07'

   
--���۳ɱ���ת������쳣
select a.pk_org,
       a.vbillcode,
       a.caccountperiod,
       b.nprice,
       b.nnum,
       round(b.nmny, 2) "nmny",
       round(b.nprice * b.nnum, 2) "je"
  from ia_i5bill a
  left join ia_i5bill_b b
    on a.cbillid = b.cbillid
 where a.dr = 0
   and b.dr = 0
   and round(b.nprice * b.nnum, 2) <> round(b.nmny, 2)  
   and a.caccountperiod = '2018-07'
   
   --�ڲ������嵥����쳣
  select a.pk_org,
         a.vbillcode,
         a.dbilldate,
         b. norigprice,
         b.nnumber,
         b.norigmny,
         b.norigprice * b.nnumber "je"
    from to_settlelist a
    left join to_settlelist_b b
      on a.cbillid = b.cbillid
   where a.dr = 0
     and b.dr = 0
     and round(b.norigprice * b.nnumber, 0) <> round(b.norigmny, 0)
     and b.dbilldate > '2018-07-01 00:00:00'
     
  --���۶������ �쳣
     select a.pk_org,
            a.vbillcode,
            a.dbilldate,
            b.nitemdiscountrate,
            b.ndiscountrate,
            b.norigtaxprice,
            b.nnum,
            b.norigtaxmny,
            b.nqtorigtaxprice * b.nnum "je"
       from so_saleorder a
       left join so_saleorder_b b
         on a.csaleorderid = b.csaleorderid
      where a.dr = 0
        and b.dr = 0
        and round(b.norigtaxprice * b.nnum, 0) <> round(norigtaxmny, 0)
        and a.dbilldate > '2018-07-01 00:00:00'
      
      --����������쳣
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
        
        --���۳��ⵥ����쳣
      select a.pk_org,
             a.vbillcode,
             a.dbilldate,           
             b.norigtaxprice,
             b.nnum,
             b.norigtaxmny,
             b.nqtorigtaxprice * b.nnum "je"
        from ic_saleout_h a
        left join ic_saleout_b b
          on a.cgeneralhid = b.cgeneralhid
       where a.dr = 0
         and b.dr = 0
         and round(b.norigtaxprice * b.nnum, 0) <> round(norigtaxmny, 0)
      
      
      
      
      
      
      
   
   
