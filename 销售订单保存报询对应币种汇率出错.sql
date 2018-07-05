      
      /*销售订单保存报询对应币种汇率出错*/
      
      update to_settlelist
         set corigcurrencyid = '1002Z0100000000001K8'
       where corigcurrencyid = '美元'; --更新內部結算清單表頭币种美元为美元主键
      
      select corigcurrencyid, vbillcode, dr
        from to_settlelist
       where corigcurrencyid = '~'
       
       
       select distinct(corigcurrencyid) from to_settlelist 

 
select pk_currtype  from bd_currtype where name='日元'  --1002Z0100000000001K6

  
    update to_settlelist
         set corigcurrencyid = '1002Z0100000000001K6'
       where corigcurrencyid = '日元'; --更新內部結算清單表頭币种日元为日元主键
