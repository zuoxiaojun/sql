create or replace procedure update_so_i5bill  
--�������۳ɱ���ת��Ϊ��Ӧ�ڲ����׵�����ⵥ��
as 
begin 
  --����ia_detailledger
  update ia_detailledger a
   set (a.nprice, a.nmny) =
       (select v.nprice, nvl(v.nprice, 0) * nvl(a.nnum, 0) nmny
          from v_gcl_i5itemupdate v
         where a.cbill_bid = v.cbill_bid)
 where a.dr = 0
   and exists
 (select 1 from v_gcl_i5itemupdate v where a.cbill_bid = v.cbill_bid);
  
 --���´������I5 ���۳ɱ���ת
update ia_i5bill_b b
   set (b.nprice, b.nmny) =
       (select v.nprice, nvl(v.nprice, 0) * nvl(b.nnum, 0) nmny
          from v_gcl_icoutitem v
         where b.cicitemid = v.coutitemid)
 where b.dr = 0
   and b.pk_org = '1001D1100000000QYRNK'
   and b.nprice is null
   and exists
 (select 1 from v_gcl_icoutitem v where b.cicitemid = v.coutitemid);
 commit;
 end;
 
