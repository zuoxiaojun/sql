--���۳��ⵥ
select a.pk_org,
       a.vbillcode,
       a.dbilldate,
       b.norigtaxprice,
       b.nnum,
       b.norigtaxmny,--��˰�ϼ�
       b.ntaxmny --���Ҽ�˰�ϼ�
       

  from ic_saleout_h a
  left join ic_saleout_b b
    on a.cgeneralhid = b.cgeneralhid
 where a.dr = 0
   and b.dr = 0
   and a.vbillcode = '80100XC20170605001'
