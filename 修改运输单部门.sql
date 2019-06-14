--修改运输单部门

--运输单
select vdef20
  from dm_delivbill
 where vbillcode in ('81600YS20190430048') for update ;

select code,name , pk_dept  from org_dept where name='计划保障-计划'  --1001D1100000000MT85Q

--应付运费发票
select vdef20
  from dm_apinvoice
 where vbillcode = '81500WF201905220107'
   for update


