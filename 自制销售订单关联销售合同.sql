--�������۶����������ۺ�ͬ
select pk_ct_sale,ctrantypeid from ct_sale where vbillcode='GCL-XXJC-XSSW-2018-0336��'--1001D110000000AET9C2

select  nordnum,pk_ct_sale_b  from ct_sale_b where pk_ct_sale='1001D110000000AET9C2' for update --�޸��ۼƶ�������

select vctcode,
       cctmanageid,
       cctmanagebid,
       vsrctype,
       vsrctrantype,
       vsrccode,
       vsrcrowno,
       csrcid,
       csrcbid
  from so_saleorder_b
 where csaleorderid = (select csaleorderid
                         from so_saleorder
                        where vbillcode = '82500XD20180517048'
                          and dr = 0)    -- for update �޸����۶���������Դ������Ϣ
