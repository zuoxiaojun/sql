select pk_marbasclass from bd_marbasclass where code like '0104%'

select pk_marasstframe, code, name
  from bd_material
 where pk_marbasclass in
       (select pk_marbasclass from bd_marbasclass where code like '0104%')
   and dr = 0
   
   --and pk_marasstframe ='1001B1100000000095T7';
   
select   pk_marasstframe,name  from  bd_marasstframe 

select *
  from ic_onhanddim
 where cmaterialvid  in (select  pk_material 
                          from bd_material
                         where pk_marbasclass in
                               (select pk_marbasclass
                                  from bd_marbasclass
                                 where code like '0104%')
                           and dr = 0)  and vfree4 ='1001B1100000000095T7'



select code, name, pk_defdoc from bd_defdoc where name = '正品合格' --1001B1100000000095SO

select distinct (cmaterialoid), pk_onhanddim 
  from ic_onhanddim
 where vfree3 = '1001B1100000000095SO' --1001B1100000000095SO
   and cmaterialoid in (select pk_material
                          from bd_material
                         where pk_marbasclass in
                               (select pk_marbasclass
                                  from bd_marbasclass
                                 where code like '0104%'))
 
 

select a.cmaterialoid,a.vfree3,b.nonhandnum 
  from ic_onhanddim a
  left join ic_onhandnum b
    on a. pk_onhanddim = b. pk_onhanddim
 where a.cmaterialoid in
       (select pk_material
          from bd_material
         where pk_marbasclass in
               (select pk_marbasclass
                  from bd_marbasclass
                 where code like '0104%'))
  and a.vfree3 ='1001B1100000000095SO'
  and b.nonhandnum <>0   --现存量表
  
  
select pk_material, code, name
  from bd_material
 where pk_material in (select a.cmaterialoid
                         from ic_onhanddim a
                         left join ic_onhandnum b
                           on a. pk_onhanddim = b. pk_onhanddim
                        where a.cmaterialoid in
                              (select pk_material
                                 from bd_material
                                where pk_marbasclass in
                                      (select pk_marbasclass
                                         from bd_marbasclass
                                        where code like '0104%'))
                          and a.vfree3 = '1001B1100000000095SO'
                          and b.nonhandnum <> 0) --现存量表
