select pk_billtypeid from bd_billtype where pk_billtypecode = '30-Cxx-05'; --1001D11000000010JUVA

select fsalemode
  from so_m30trantype
 where ctrantypeid = (select pk_billtypeid
                        from bd_billtype
                       where pk_billtypecode = '30-Cxx-05')
   for update
