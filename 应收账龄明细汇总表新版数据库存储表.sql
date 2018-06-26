 --GCL_ARAGEDETAIL   --GCL_ARAGEDETAIL_B
--应收账龄明细汇总表新版数据库存储表
select * from GCL_ARAGEDETAIL
select * from GCL_ARAGEDETAIL_B

select * from GCL_ARAGEDETAIL a left join GCL_ARAGEDETAIL_B b on a.pk_bill=b.pk_bill
