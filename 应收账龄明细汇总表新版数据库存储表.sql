 --GCL_ARAGEDETAIL   --GCL_ARAGEDETAIL_B
--应收账龄明细汇总表新版数据库存储表
--truncate table GCL_ARAGEDETAIL_B

select * from GCL_ARAGEDETAIL
select * from GCL_ARAGEDETAIL_B  --CONTRACTNO

select *
  from GCL_ARAGEDETAIL a
  left join GCL_ARAGEDETAIL_B b
    on a.pk_bill = b.pk_bill order by b.ts desc



select sum(YSYQ), sum(yqqk_n_30), sum(yqqk_31_60), sum(yqqk_61_90)
  from GCL_ARAGEDETAIL_B
 where CONTRACTNO = 'CNINJ-GF307-CG/SB-002'
  






