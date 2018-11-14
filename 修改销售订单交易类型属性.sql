select pk_billtypeid from bd_billtype where pk_billtypecode = '30-Cxx-03' --1001D11000000019KYRH

select fsalemode
  from so_m30trantype
 where ctrantypeid = '1001D11000000019KYRH' for update 
