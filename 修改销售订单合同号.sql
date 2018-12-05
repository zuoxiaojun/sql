select cctmanagebid,
       cctmanageid,
       vctcode,
       vfirstcode,
       vfirstrowno,
       vsrccode,
       vsrcrowno
  from so_saleorder_b
 where csaleorderid =
       (select csaleorderid
          from so_saleorder
         where vbillcode = '81500XD20181102002')
   and dr = 0  for update
;
select pk_ct_sale_b, nnum
  from ct_sale_b
 where pk_ct_sale = (select pk_ct_sale
                       from ct_sale
                      where vbillcode = 'GCL/FNXX-CG/XZ-2018-0117'
                        and blatest = 'Y')
