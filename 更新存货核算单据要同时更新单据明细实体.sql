select crowno, nnum, nastnum, nprice, nmny
  from ia_iibill_b
 where cbillid =
       (select cbillid from ia_iibill where vbillcode = '80100II2018010167' and dr=0) for update  --������ⵥ
       
       
       
       select nnum, nprice, nmny, cbill_bid 
         from ia_i2bill_b
        where cbillid = (select cbillid
                           from ia_i2bill
                          where vbillcode = '80900I22018060610') for update --�ɹ���ⵥ



select crowno, nnum, nastnum, nprice, nmny,cbill_bid
  from ia_ijbill_b
 where cbillid  =
       (select cbillid from ia_ijbill where vbillcode = '81600IJ201806270255' and dr=0) for update   --�������ⵥ




select nnum, nprice, nmny
  from ia_detailledger
 where cbill_bid  = '1001D110000000AVH8SV' for update  --������ϸʵ��
