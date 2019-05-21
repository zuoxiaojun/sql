/**********************************

批量更新80501销售合同与收款协议关联

********************************************************/

select   pk_payterm,actualvalidate   from ct_sale where vbillcode ='20180718-1'

select code, name, pk_income
  from bd_income
 where name in ('GCL/XXJC-XSHTHW(A)-2019-0008号',
                'GCL/XXJC-XSHTHW(A)-2019-0021号',
                'GCL/XXJC-XSHTHW(A)-2019-0070号',
                'GCL/XXJC-XSHTHW(A)-2019-0078号',
                'GCL/XXJC-XSHTHW(A)-2019-0052号')



--创建中间合同与收款协议关联表
create table HTSKXY
(
  htcode   VARCHAR2(100),--合同编码
  skxypk   VARCHAR2(100),--收款协议pk
  skxycode VARCHAR2(100),--收款协议编码
  sxdate   CHAR(19)      --合同生效日期
)

select * from HTSKXY;

truncate table HTSKXY

--借助odbc导入关联数据

--更新合同收款协议字段

update ct_sale a
   set a.pk_payterm =
       (select skxypk from htskxy b where a.vbillcode = b.htcode)
 where exists (select 1 from htskxy b where a.vbillcode = b.htcode)
and a.blatest ='Y'
