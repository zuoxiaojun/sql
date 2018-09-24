select vpathcode, vpathname
  from to_settlepath
 where blatestflag = 'Y'
   and dr = 0
   and vpathcode = '117'
   for update
