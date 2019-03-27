select djlxbm, djbh from er_bxzb where djlxbm = '2642'

--使用表体自定义项25作为交通工具
select distinct (defitem25 ) from er_busitem  --交通工具


--创建交通工具与税码对照表

create table jtbx_sm (
pk_jtgj  varchar2(20),--交通工具
name_jtgj  varchar2(255),
pk_sm    varchar2(20), --税码
name_sm varchar2(200)
)

--defitem21->getColValue(bd_taxrate, taxrate, pk_taxcode,defitem20 );
select * from  jtbx_sm for update 

--获取交通工具档案值
select code, name, pk_defdoc
  from bd_defdoc
 where pk_defdoclist =
       (select pk_defdoclist from bd_defdoclist where code = 'JTGJ001')

insert into jtbx_sm
  select pk_defdoc, name,'~','~'
    from bd_defdoc
   where pk_defdoclist =
         (select pk_defdoclist from bd_defdoclist where code = 'JTGJ001')

select  code , pk_taxcode  from bd_taxcode where code like '%CN%'


税码    	defitem20
税率      defitem21
不含税额 	defitem22
税额     	defitem23


/*
金额字段上设置编辑公式：	amount
defitem22->amount/(1+defitem21/100);
defitem23->defitem22*defitem21/100

*/




