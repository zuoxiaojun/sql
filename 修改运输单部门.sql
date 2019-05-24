--修改运输单部门

select vdef20
  from dm_delivbill
 where vbillcode in ('82500YS20190429048','82500YS20190429046') for update ;

select code,name , pk_dept  from org_dept where code='82511'  --1001D11000000052KQFW

select vdef20 from dm_apinvoice where vbillcode ='80100WF201905200093'


