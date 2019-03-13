
/*修改凭证辅助核算值*/

--select pk_cust_sup, code, name from bd_cust_supplier

select assid, f4,dr --辅助核算表，F4表示客商辅助
  from gl_docfree1
 where assid in (select assid --1001ZZ10000000000PH0
                   from gl_detail
                  where explanation = '1' --摘要
                    and detailindex = 2)  --分录号
   for update
   
   
--辅助项目值（凭证上最终显示值）

select freevalueid,typevalue1 
  from gl_freevalue
 where freevalueid = '1001ZZ10000000000PH0'
   for update

