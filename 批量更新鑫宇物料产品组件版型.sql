--【批量更新鑫宇物料产品组件版型】

select code, name, pk_material
  from bd_material_v
 where pk_marbasclass =
       (select pk_marbasclass from bd_marbasclass where code = '97') ;
       
     --鑫宇版型  
       create table xybx (
       code  varchar2(100),
       name  varchar2(100),
       bxname varchar2(100),
       bxpk      varchar2(100)
       )
            
       select * from xybx
       
       --更新物料版型
       update bd_material a
          set a.def1 =
              (select b.bxpk from xybx b where a.code = b.code)
        where exists (select * from xybx b where a.code = b.code)
       
        update bd_material_v a
           set a.def1 =
               (select b.bxpk from xybx b where a.code = b.code)
         where exists (select * from xybx b where a.code = b.code)
       
       
       
       
       
       
