select sourceflag,busistatus,vbillstatus,busistatus   
  from cmp_transformbill
 where vbillno = '36S4190500005' and dr =0
   for update --���˽��㵥�޸���Դϵͳ  2
     
   
   
   --�޸Ļ��˽��㵥����״̬
   select busistatus, vbillstatus, settlesatus
     from cmp_transformbill
    where vbillno = '36S4190500011'
      and pk_org =
          (select pk_financeorg from org_financeorg where code = '802')
      for update



