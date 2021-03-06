--算术运算符
DECLARE
    v_num1   NUMBER(3):=10;
    v_num2   NUMBER(3):=2;
BEGIN
    DBMS_OUTPUT.PUT_LINE(v_num1+v_num2);
    DBMS_OUTPUT.PUT_LINE(v_num1-v_num2);
    DBMS_OUTPUT.PUT_LINE(v_num1*v_num2);
    DBMS_OUTPUT.PUT_LINE(v_num1/v_num2);
    DBMS_OUTPUT.PUT_LINE(v_num1**v_num2);
END;

--关系运算符
DECLARE
    v_num1  NUMBER(2) := &n1;
    v_num2  NUMBER(2) := &n2;
BEGIN
    IF (v_num1 = v_num2) THEN
          DBMS_OUTPUT.PUT_LINE('num1等于num2');
    ELSIF(v_num1 < v_num2) THEN
          DBMS_OUTPUT.PUT_LINE('num1小于num2');
    ELSIF(v_num1 > v_num2) THEN
          DBMS_OUTPUT.PUT_LINE('num1大于num2');
    END IF;
    
    IF (v_num1 <> v_num2) THEN
          DBMS_OUTPUT.PUT_LINE('num1不等于num2');
    END IF;
END;

--比较运算符
DECLARE
  --&n1是替代变量，在执行程序时会提示输入值
    v_num1  NUMBER(2):= &n1;
BEGIN
    IF(v_num1 BETWEEN 5 AND 10 )THEN
              DBMS_OUTPUT.PUT_LINE('num1在5到10之间');
    ELSE
              DBMS_OUTPUT.PUT_LINE('num1不在5到10之间');
    END IF;
    
    IF(v_num1 IN(3,8,10) )THEN
              DBMS_OUTPUT.PUT_LINE('num1等于3,8,10中的一个值');
    ELSE
              DBMS_OUTPUT.PUT_LINE('num1不等于3,8,10中的一个值');
    END IF;
    
    IF(v_num1 IS NULL)THEN
              DBMS_OUTPUT.PUT_LINE('num1为空');
    ELSE
              DBMS_OUTPUT.PUT_LINE('num1不为空');
    END IF;
END;

--逻辑运算符
DECLARE
    v_b1  BOOLEAN  := &n1;
    v_b2  BOOLEAN  := &n2;
BEGIN
    IF(v_b1 AND v_b2)THEN
            DBMS_OUTPUT.PUT_LINE('AND--TRUE');
    END IF;
    
    IF(v_b1 OR v_b2)THEN
            DBMS_OUTPUT.PUT_LINE('OR--TRUE');
    END IF;
    
    IF(NOT v_b1)THEN
            DBMS_OUTPUT.PUT_LINE('v_b1取反为TRUE');
    END IF;
END;













