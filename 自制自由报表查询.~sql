
--自制自由报表查询
select count(id)
  from iufo_freereport
 where pk_dir not in (select pk_dir
                        from iufo_freerep_dir
                       where sysInit = 'Y'
                          or modulecode = 'hr')
