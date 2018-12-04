--������ⵥ�ݹ�δ�س��ѯ

select a.vbillcode, b.nredbacknum, b.vsrctype
  from ia_iibill a
  left join ia_iibill_b b
    on a.cbillid = b.cbillid
 where a.bestimateflag = 'Y'
   and b.nredbacknum is null
   and b.vsrctype = '45';

select distinct (vbillcode)
  from (select a.vbillcode, b.nredbacknum, b.vsrctype
          from ia_iibill a
          left join ia_iibill_b b
            on a.cbillid = b.cbillid
         where a.bestimateflag = 'Y'
           and b.nredbacknum is null
           and b.nprice <>'0.00000000'
           and b.vsrctype = '4E'
           and b.dr=0)

