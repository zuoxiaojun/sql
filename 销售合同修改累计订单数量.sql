--���ۺ�ͬ�޸��ۼƶ�������
select nnum, pk_material, pk_ct_sale_b, nordnum, nordsum  --1001D1100000005YC9IX
  from ct_sale_b
 where pk_ct_sale = (select pk_ct_sale   --1001D11000000017EUR0
                       from ct_sale
                      where vbillcode = '261259676756648'
                        and blatest = 'Y')
                        -- for update 


select * from so_saleorder_b where cfirstbid ='1001D110000000G6QNOW'
