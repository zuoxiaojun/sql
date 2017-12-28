select distinct(fintransitflag)
  from ia_i5bill
 where dbilldate between '2017-09-01 00:00:00' and '2017-11-30 00:00:00'

select vbillcode,dr
  from ia_i5bill
 where fintransitflag = -1
   and dbilldate between '2017-11-01 00:00:00' and '2017-11-30 00:00:00'
