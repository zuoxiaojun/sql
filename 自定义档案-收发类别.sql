select pk_defdoc, code,name
  from bd_defdoc
 where pk_defdoclist =
       (select pk_defdoclist from bd_defdoclist where name = '供应商门户状态');
       
    
        
