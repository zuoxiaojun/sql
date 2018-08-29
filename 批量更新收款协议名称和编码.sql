--批量更新收款协议名称和编码
--创建数据对照表
create table SKXY
(
  oldcode VARCHAR2(255),
  oldname VARCHAR2(255),
  newcode VARCHAR2(255),
  newname VARCHAR2(255)
)

--导入数据(ODBC)

select * from SKXY

select * from bd_income

delete from SKXY where newcode is null and newname is null

--更新编码
update bd_income a
   set a.code =
       (select b.newcode
          from SKXY b
         where a.code = b.oldcode
           and b.newcode is not null)
 where exists (select 1
          from SKXY b
         where a.code = b.oldcode
           and b.newcode is not null)
           
 --更新名称
 
 update bd_income a
    set a.name =
        (select b.newname
           from SKXY b
          where a.name = b.oldname
            and b.newname is not null)
  where exists (select 1
           from SKXY b
          where a.name = b.oldname
            and b.newname is not null)
 
           






