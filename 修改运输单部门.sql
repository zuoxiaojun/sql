--修改运输单部门
--应付运费发票
select vdef20
  from dm_apinvoice
 where vbillcode = '81300WF201906060032'
 
 
--运输单  

select vdef20
  from dm_delivbill
 where vbillcode in ('81200YS20190521058') for update ;


--部门pk
select code,name , pk_dept  from org_dept where name='日本'  --1001D110000000FJGZAC

update dm_delivbill
   set vdef20 = '1001D110000000F1TE16'
 where vbillcode in ('81300YS20190429168',
                     '81300YS20190429167',
                     '81300YS20190429171',
                     '81300YS20190429170',
                     '81300YS20190402027')
