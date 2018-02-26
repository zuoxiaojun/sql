select pk_ct_sale
  from ct_sale
 where vbillcode = 'GCL/XMBU-XSSW2017-0139'
   and dr = 0
   and blatest = 'Y' --1001D11000000016TBE9
   
   select crowno, nordnum, nordsum, pk_ct_sale_b
     from ct_sale_b
    where pk_ct_sale = '1001D11000000016TBE9' for update  --1001D1100000001AHAW2
    
    select nnum, nastnum,dr,csaleorderbid,csaleorderid
      from so_saleorder_b
     where csrcbid = '1001D1100000001AHAW2'  --1001D1100000001AHMU9
     
select dr,vbillcode,dmakedate  from so_saleorder where csaleorderid = '1001D1100000001AHMU9'
