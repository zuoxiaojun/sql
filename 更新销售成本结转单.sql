select * from xscbd  --���۳ɱ���ת����Ӧ���ⵥ��

--�������۳ɱ���ת�����=����*������
update ia_i5bill_b
    set nmny=round((nnum*nprice ),6)
  where cbillid = (select cbillid
                     from ia_i5bill
                    where vbillcode = '80100I52018061338'
                      and dr = 0);
                     
--���µ�����ϸʵ�� ���=����*����
update ia_detailledger
   set nmny=round((nnum*nprice ),6)
 where cbillid = (select cbillid
                    from ia_i5bill
                   where vbillcode = '80100I52018061338'
                     and dr = 0)
