/*�����ɹ����������ۼƵ������ۼ��������*/
select nbackarrvnum,nbackstorenum,naccumarrvnum,naccumstorenum
  from po_order_b
 where pk_order =
       (select pk_order from po_order where vbillcode = '81600CD20170904008'and dr=0 and bislatest='Y') --for update 
