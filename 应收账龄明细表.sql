  --gcl_aragedetail          应收账龄明细表主表
--gcl_aragedetail_b      应收账龄明细表子表


select * from gcl_aragedetail a left join gcl_aragedetail_b b on a.pk_bill=b.pk_bill
