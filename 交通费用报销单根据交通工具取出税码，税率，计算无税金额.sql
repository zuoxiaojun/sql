select djlxbm, djbh from er_bxzb where djlxbm = '2642'

--ʹ�ñ����Զ�����25��Ϊ��ͨ����
select distinct (defitem43) from er_busitem  --��ͨ����


--������ͨ������˰����ձ�

create table jtbx_sm (
pk_jtgj  varchar2(20),--��ͨ����
name_jtgj  varchar2(255),
pk_sm    varchar2(20), --˰��
name_sm varchar2(200)
)

--defitem21->getColValue(bd_taxrate, taxrate, pk_taxcode,defitem20 );
select * from  jtbx_sm for update 
truncate table jtbx_sm

/*

defitem20->getcolvalue( jtbx_sm, pk_sm,name_jtgj ,defitem25 );
defitem21->getColValue(bd_taxrate, taxrate, pk_taxcode,defitem20 );

*/


--��ȡ��ͨ���ߵ���ֵ
select code, name, pk_defdoc
  from bd_defdoc
 where pk_defdoclist =
       (select pk_defdoclist from bd_defdoclist where code = 'JTGJ001')

insert into jtbx_sm
  select pk_defdoc, name,'~','~'
    from bd_defdoc
   where pk_defdoclist =
         (select pk_defdoclist from bd_defdoclist where code = 'JTGJ001')

select code, pk_taxcode from bd_taxcode where code in ('CN23', 'CN24')


˰��    	defitem20
˰��      defitem21
����˰�� 	defitem22
˰��     	defitem23
1	CN23	1001D110000000GIM1G0
2	CN24	1001D110000000GIM1GQ



/*
����ֶ������ñ༭��ʽ��	amount
defitem22->amount/(1+defitem21/100);
defitem23->defitem22*defitem21/100

*/




