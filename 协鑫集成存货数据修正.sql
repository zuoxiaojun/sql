/*Э�μ��ɴ����������*/

/*���۳ɱ���ת��*/
--��ѯ���۳ɱ���ת��
select a.pk_org,
       a.vbillcode,
       a.caccountperiod,
       b.nprice,
       b.nnum,
       round(b.nmny, 2) "nmny",
       round(b.nprice * b.nnum, 2) "je",
       b.cbill_bid
  from ia_i5bill a
  left join ia_i5bill_b b
    on a.cbillid = b.cbillid
 where a.dr = 0
   and b.dr = 0
   and round(b.nprice * b.nnum, 2) <> round(b.nmny, 2)  
   and a.caccountperiod > '2018-01'
   
  --���� ia_i5bill_b
 update ia_i5bill_b
    set nmny = round((nprice * nnum), 2)
  where cbill_bid in (select                     
                       b.cbill_bid
                        from ia_i5bill a
                        left join ia_i5bill_b b
                          on a.cbillid = b.cbillid
                       where a.dr = 0
                         and b.dr = 0
                         and round(b.nprice * b.nnum, 2) <> round(b.nmny, 2)
                         and a.caccountperiod > '2018-01')
                         
 --���µ�����ϸʵ��ia_detailledger
 update ia_detailledger
    set nmny = round((nprice * nnum), 2)
  where cbill_bid in
        (select cbill_bid
           from ia_detailledger
          where vsrctype = '4C'
            and caccountperiod > '2018-01'
            and pk_org = '1001D1100000000QYRNK'
            and round(nprice * nnum, 2) <> round(nmny, 2))
            
  
  /*���·�����Ʒ��ϸ��*/
  select pk_org,
         vbillcode,
         cinventoryid,
         ccalcthreadid,
         ccalcrangeid,
         cbilltypecode,
         nnum,
         nprice,
         nmny,
         round(nprice * nnum, 2) "je"
    from ia_goodsledger
   where pk_org = '1001D1100000000QYRNK'
     and caccountperiod > '2018-01'
     and round(nprice * nnum, 2) <> round(nmny, 2)
     and fintransitflag = '0';
            
 update ia_goodsledger
    set nmny = round(nprice * nnum, 2)
  where pk_org = '1001D1100000000QYRNK'
    and caccountperiod > '2018-01'
    and round(nprice * nnum, 2) <> round(nmny, 2)
    and fintransitflag = '0'
    
  /*������ⵥ */
 select a.pk_org,
        b.cbill_bid,
        a.vbillcode,
        a.caccountperiod,
        b.nprice,
        b.nnum,
        b.nmny,
        round(b.nprice * b.nnum, 2) "je"
   from ia_iibill a
   left join ia_iibill_b b
     on a.cbillid = b.cbillid
  where a.dr = 0
    and b.dr = 0
    and round(b.nprice * b.nnum, 2) <> b.nmny
    and a.caccountperiod > '2018-01' 
  
  --���˳�Ҫ���µ����ݽ��и���
  --��������  �����ȷ�����۴���
update ia_iibill_b
   set nprice = nmny / nnum
 where CBILL_BID in ('1001D1100000009QJNB4',
                     '1001D1100000009QJNB3',
                     '1001D110000000A3XD03',
                     '1001D110000000A7CWO5',
                     '1001D110000000A7CWOU',
                     '1001D110000000AJQ59E',
                     '1001D110000000AJQ59D',
                     '1001D110000000AJQ59B',
                     '1001D110000000AJQ59A',
                     '1001D110000000AXLE7C')
                    
--������ϸʵ��
  update ia_detailledger
     set nprice = nmny / nnum
   where cbill_bid in ('1001D1100000009QJNB4',
                       '1001D1100000009QJNB3',
                       '1001D110000000A3XD03',
                       '1001D110000000A7CWO5',
                       '1001D110000000A7CWOU',
                       '1001D110000000AJQ59E',
                       '1001D110000000AJQ59D',
                       '1001D110000000AJQ59B',
                       '1001D110000000AJQ59A',
                       '1001D110000000AXLE7C')
                       
  --�������ͣ�������ȷ��������
 update ia_iibill_b
    set nprice = nmny / nnum
  where CBILL_BID in ('1001D110000000AVR2TE', '1001D110000000AXE9JJ')
  
   update ia_detailledger
      set nprice = nmny / nnum
    where cbill_bid in ('1001D110000000AVR2TE', '1001D110000000AXE9JJ')
  
  
  
  
  
                         
                         
