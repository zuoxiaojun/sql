select busistatus��vbillstatus��modifier, modifiedtime   from cmp_apply where vbillno = 'SS18062157'  for update  --    3 1
  /* �������뵥�޸�Ϊδ�ύ������̬*/



select busistatus, vbillstatus,pk_apply 
  from cmp_apply
 where vbillno = 'SS19062917'
   and pk_org in (select pk_org from org_orgs where code = '802') --��ͷ



select busistatus, vbillstatus
  from cmp_apply_b
 where pk_apply =
       (select pk_apply from cmp_apply where vbillno = 'SS19062917')   --����

