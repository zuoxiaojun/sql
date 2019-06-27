--根据合同号修改客户性质

/*查询客户性质*/
select code, name, pk_defdoc
  from bd_defdoc
 where pk_defdoclist =
       (select pk_defdoclist from bd_defdoclist where name = '客户性质')

/*受托开发可全部修改为重点客户*/

update ct_sale
   set vdef4 = '1001D1100000009IN33I'
 where vdef4 = '1001D1100000009IN33D'


/*按照合同号更新*/

create table htxz (
vbillcode varchar(40),
vdef4  varchar(101) 
)

select * from htxz

truncate table htxz

update ct_sale a
   set a.vdef4 =
       (select b.vdef4 from htxz b where a.vbillcode = b.vbillcode)
 where exists (select * from htxz b where a.vbillcode = b.vbillcode)
 and blatest ='Y'



select vdef4
  from ct_sale
 where vbillcode = 'GCL/XXJC-XS-2018-0057'  --1001D1100000009IN33B
   and blatest = 'Y'
   for update


--更新合同客户性质为双经销  1001D1100000009IN33H

update ct_sale
   set vdef4 = '1001D1100000009IN33H'
 where vbillcode in ('GCL/DSWF-QT-20180090号',
                     'GCL/DSWF-QT-20180104号',
                     'GCL/DSWF-QT-20190025号',
                     'GCL/ZJGJC-QT-20180068',
                     'GCL/ZJGJC-QT-20180095',
                     'GCL/ZJGJC-XSSW-20180019',
                     'CHYN-GCL201805-1')















