  --����ɾ��TEMQ��洢����
  create or replace procedure droptemq is
  LNAME VARCHAR2(200); --��������
BEGIN
  FOR X IN (select TABLE_NAME from user_tables where table_name like 'TEMQ%') LOOP
    LNAME := X.TABLE_NAME;
    EXECUTE IMMEDIATE 'DROP TABLE ' || X.TABLE_NAME;
  END LOOP; --ѭ��
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line(LNAME);
    RAISE;
END;
/
