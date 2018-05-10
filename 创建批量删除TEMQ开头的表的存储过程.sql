  --创建删除TEMQ表存储过程
  create or replace procedure droptemq is
  LNAME VARCHAR2(200); --声明变量
BEGIN
  FOR X IN (select TABLE_NAME from user_tables where table_name like 'TEMQ%') LOOP
    LNAME := X.TABLE_NAME;
    EXECUTE IMMEDIATE 'DROP TABLE ' || X.TABLE_NAME;
  END LOOP; --循环
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line(LNAME);
    RAISE;
END;
/
