      
      /*���۶������汨ѯ��Ӧ���ֻ��ʳ���*/
      
      update to_settlelist
         set corigcurrencyid = '1002Z0100000000001K8'
       where corigcurrencyid = '��Ԫ'; --���Ȳ��Y����α��^������ԪΪ��Ԫ����
      
      select corigcurrencyid, vbillcode, dr
        from to_settlelist
       where corigcurrencyid = '~'
       
       
       select distinct(corigcurrencyid) from to_settlelist 

 
select pk_currtype  from bd_currtype where name='��Ԫ'  --1002Z0100000000001K6

  
    update to_settlelist
         set corigcurrencyid = '1002Z0100000000001K6'
       where corigcurrencyid = '��Ԫ'; --���Ȳ��Y����α��^������ԪΪ��Ԫ����
