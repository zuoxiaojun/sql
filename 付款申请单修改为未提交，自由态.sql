select busistatus��vbillstatus��modifier, modifiedtime   from cmp_apply where vbillno = 'SS18062157'  for update  --    3 1
  /* �������뵥�޸�Ϊδ�ύ������̬*/

update cmp_apply
   set busistatus = '1',vbillstatus = '-1'
 where vbillno = 'SS18062157'    --��ͷ


select busistatus, vbillstatus
  from cmp_apply_b
 where pk_apply =
       (select pk_apply from cmp_apply where vbillno = 'SS18062157') --����


select * from cmp_apply where vbillno = 'SS18081228'
