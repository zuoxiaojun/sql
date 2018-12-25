select pk_marasstframe  from bd_material_v where code ='0307131529'

select pk_marasstframe  from bd_material where code='0307131529'

select dr,vsrcrowno,cctmanageid,cctmanageid,csrcid,csrcbid
  from so_saleorder_b
 where csaleorderid =
       (select csaleorderid
          from so_saleorder
         where vbillcode = '82600XD20181220001') and dr =0  --1001D110000000E0JSCK


select * from ct_sale_b where pk_ct_sale_b='1001D110000000E0JSCK'


select pk_ct_sale_b,crowno,pk_material,pk_srcmaterial,vchangerate,nnum,nastnum
  from ct_sale_b
 where pk_ct_sale = (select pk_ct_sale
                       from ct_sale
                      where vbillcode = 'GCL/XXJC-XSSW(F)-2018-0029ºÅ'
                        and blatest = 'Y')
   and dr = 0
   
   for update 
