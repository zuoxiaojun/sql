select pk_group from ct_sale where vbillcode = '0001'  --      pk_group         0001A110000000000MFL  

select pk_ct_sale,pk_org,pk_org_v,VDEF20,PK_GROUP  from ct_sale where vbillcode ='B.B.B. s.r.o-Ӧ�ղ�1' for update  --1001D110201708112001
select * from ct_sale_b  where pk_ct_sale='1001D110201708112001' for update--   PK_FINANCEORG     0001D11000000007DSO7

select distinct(pk_group) from ct_sale_b 
--ԭ���ݿ�����ڳ���ͬ���ݱ���
create table qcct_sale as select * from ct_sale where pk_group is null  
create table qcct_sale_b as  select * from ct_sale_b where pk_group is null 
--�����ڳ���־
update ct_sale set VDEF20 = 'Y' where pk_group is null;
update ct_sale
   set pk_group = '0001A110000000000MFL'
 where pk_group is null;
 --���¼����ֶ�
update ct_sale_b
   set pk_group = '0001A110000000000MFL'
 where pk_group is null;
 --����pk_org�ֶ�
update ct_sale a
   set a.pk_org =
       (select b.PK_FINANCEORG
          from ct_sale_b b
         where a.pk_ct_sale = b.pk_ct_sale
           and a.vdef20 = 'Y')
 where exists (select 1 from ct_sale_b b where a.pk_ct_sale = b.pk_ct_sale and a.vdef20='Y')

select pk_org,pk_org_v from ct_sale where vdef20='Y'

/*pk_org                                                          pk_org_v
0001D11000000007EITA                     0001D11000000007EIT9
0001D1100000000CDRYY                   0001D1100000000CDRYX
0001A210000000004PEY                    0001A210000000004PEX
0001B11000000000YALI                     0001B11000000000YALH
0001D11000000007DSO7                  0001D11000000007DSO6
0001D11000000004VL4H                   0001D11000000004VL4G

*/
select distinct(pk_org) from ct_sale where pk_org='0001D11000000007DSO7'  

update ct_sale set pk_org_v='0001D11000000004VL4G' where pk_org='0001D11000000004VL4H' and vdef20='Y'

select distinct(pk_org) from ct_sale where vdef20='Y' and pk_org_v is null

select pk_org,pk_org_v from ct_sale where pk_org='0001D11000000007DSO7'



select vbillcode,dr from ct_sale where pk_ct_sale='1001D110201707241017'

--�ڳ���ʷ��ͬ�޸ĺ���±���ɾ�����

update ct_sale_b
   set dr = 0
 where pk_ct_sale in (select pk_ct_sale
                        from ct_sale
                       where vdef20 = 'Y'
                         and dr = 0)
   and dr = 1
