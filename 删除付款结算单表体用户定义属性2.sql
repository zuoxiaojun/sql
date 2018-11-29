select pk_userdefrule  from bd_userdefrule where code ='erm_264X_B';


select *
  from bd_userdefitem
 where pk_userdefrule = (select pk_userdefrule
                           from bd_userdefrule
                          where code = 'erm_264X_B') and propindex ='21'   ;  

delete   from bd_userdefitem 
 where pk_userdefrule = (select pk_userdefrule
                           from bd_userdefrule
                          where code = 'erm_264X_B')
   and propindex = 49;   --…æ≥˝ Ù–‘∂®“Â
