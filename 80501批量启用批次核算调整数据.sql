--80501批量启用批次核算调整数据

create table wlpc (
code varchar2(255)
)

select * from wlpc

select pk_accountingbook from org_accountingbook where code = '80501-XXJC' --1001B1100000000141DM

select costmode, batchcost
  from bd_materialcostmod
 where pk_setofbook = '1001B1100000000141DM'
   and pk_material in
       (select pk_material
          from bd_material
         where code in (select code from wlpc))
         
         
 update bd_materialcostmod
    set batchcost = 'Y'
  where pk_setofbook = '1001B1100000000141DM'
    and pk_material in
        (select pk_material
           from bd_material
          where code in (select code from wlpc))
         
         
