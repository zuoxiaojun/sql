
--单独修改凭证摘要
select explanation
  from gl_detail
 where explanation =
       '38448539泰安协鑫电力,销售,72-8-325W 5BB多晶组件-A级,集成零单户,(合同：17年国内6组零单户)'
   for update --凭证明细

select explanation
  from gl_voucher
 where explanation =
       '38448539泰安协鑫电力,销售,72-8-325W 5BB多晶组件-A级,集成零单户,(合同：17年国内6组零单户'
   for update --凭证表头
