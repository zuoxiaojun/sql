 --GCL_ARAGEDETAIL   --GCL_ARAGEDETAIL_B
--应收账龄明细汇总表新版数据库存储表
select * from GCL_ARAGEDETAIL
select * from GCL_ARAGEDETAIL_B  --CONTRACTNO

select *
  from GCL_ARAGEDETAIL a
  left join GCL_ARAGEDETAIL_B b
    on a.pk_bill = b.pk_bill
  left join ct_sale c
    on b.CONTRACTNO = c.vbillcode
 where c.blatest = 'Y'
   and c.dr = 0

select  vbillcode,pk_org from ct_sale where blatest ='Y' and dr =0
