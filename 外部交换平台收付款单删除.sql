

--�տɾ��
update ar_gatherbill set dr=1 where billno = '80100SK18080110'
update ar_gatheritem set dr=1  where billno ='80100SK18080110'

--���ɾ��

select src_syscode
  from ap_paybill
 where billno = '80100FK18080069'
   for update

