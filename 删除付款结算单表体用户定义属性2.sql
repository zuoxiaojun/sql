select pk_userdefrule  from bd_userdefrule where code ='erm_264X_B';


select *
  from bd_userdefitem
 where pk_userdefrule = (select pk_userdefrule
                           from bd_userdefrule
                          where code = 'erm_264X_B') and propindex =20   ;  --查询用户定义组为付款结算标题的自定义属性2

delete   from bd_userdefitem 
 where pk_userdefrule = (select pk_userdefrule
                           from bd_userdefrule
                          where code = 'erm_264X_B')
   and propindex = 35;   --删除属性定义
