select busistatus��vbillstatus��modifier, modifiedtime
  from cmp_apply
 where vbillno = 'SS18062157'
   for update --    3 1
  /* �������뵥�޸�Ϊδ�ύ������̬*/


     --       1          -1
select busistatus, vbillstatus, pk_apply
  from cmp_apply
 where vbillno = 'SS19051985'
   and pk_org in (select pk_org from org_orgs where code = '819') --��ͷ
   and dr = 0 for update


select busistatus, vbillstatus
  from cmp_apply_b
 where pk_apply ='1001D110000000H2LPHR' for update 
          --����



