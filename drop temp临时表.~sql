--1.进SQL命令行界面，运行
  grant create any table to ychr;
  grant select any table to ychr;
  grant update any table to ychr;
  grant delete any table to ychr;
  grant drop any table to ychr;
  
  

--2.进SQL界面，运行
create or replace procedure dropTempTable as
  mysql varchar2(4000);
begin
  for tablename in (select table_name
                      from user_tables t1, user_objects t2
                     where t1.temporary = 'Y'
                       and t1.table_name like 'TEMPTABLE%'
                       and t1.table_name = t2.object_name
                       and t2.object_type = 'TABLE'
                     ) loop
    begin
      mysql := 'drop table ' || tablename.table_name;
      execute immediate mysql;
    exception
      when others then
        NULL;
    end;
  end loop;
end;


  
--3.进SQL命令行界面

VARIABLE JOBNO NUMBER; 
VARIABLE INSTNO NUMBER; 
BEGIN 
    SELECT INSTANCE_NUMBER INTO :INSTNO FROM V$INSTANCE; 
    DBMS_JOB.SUBMIT(:JOBNO,'dropTempTable;',TRUNC(SYSDATE)+1+4/24,'TRUNC(SYSDATE)+3+4/24',TRUE,:INSTNO); 
    COMMIT; 
    END; 
