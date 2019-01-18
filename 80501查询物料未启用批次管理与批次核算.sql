--80501查询物料未启用批次管理与批次核算      
         select code, name
           from bd_material
          where pk_material in
                (select pk_material
                   from bd_materialstock
                  where wholemanaflag = 'N'
                    and pk_org = (select pk_stockorg
                                    from org_stockorg
                                   where code = '80501')
                    and pk_material in
                        (select distinct (cmaterialvid)
                           from ic_flowaccount_his
                          where pk_org in (select pk_stockorg
                                             from org_stockorg
                                            where code = '80501')))
               
               
               
