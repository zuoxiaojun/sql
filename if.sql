select * from user_tables

select * from employees  for update 


--�����ͱ���
declare
  v_code employees.code%type;
  v_name employees.name%type;
  v_sal  employees.sal%type;
begin
  select code, name, sal
    into v_code, v_name, v_sal
    from employees
   where code = &num1;
  dbms_output.put_line(v_code || '�Ĺ���Ϊ��' || v_sal);
end;


--if������֧

declare
  v_code employees.code%type;
  v_name employees.name%type;
  v_sal  employees.sal%type;
begin
  select code, name, sal
    into v_code, v_name, v_sal
    from employees
   where code = &num1;
  if v_sal < 8000 then
    dbms_output.put_line(v_name || '�Ĺ���Ϊ��' || v_sal);
  end if;
end;


select * from employees;


-- if else

declare
  v_code employees.code%type;
  v_name employees.name%type;
  v_sal  employees.sal%type;
begin
  select code, name, sal
    into v_code, v_name, v_sal
    from employees
   where code = &no1;
  if v_sal < 6000 then
    update employees set sal = v_sal + 200 where code = &no1;
    commit;
    dbms_output.put_line(v_name || '���¹���Ϊ��' || v_sal);
  else
    dbms_output.put_line(v_name || '�Ĺ���Ϊ��' || v_sal);
  end if;
end;

--if ���ط�֧

declare
  v_code employees.code%type;
  v_name employees.name%type;
  v_sal  employees.sal%type;
begin
  select code, name, sal
    into v_code, v_name, v_sal
    from employees
   where code = &no1;
  if v_sal < (2000) then
    dbms_output.put_line(v_name || '�Ĺ���Ϊ��' || v_sal || ';' || v_name ||
                         '���ڵ�����');
  else
    v_sal <(5000) then dbms_output.put_line(v_name || '�Ĺ���Ϊ��' || v_sal || ';' ||
                                            v_name || '����������');
  else
    dbms_output.put_line(v_name || '�Ĺ���Ϊ��' || v_sal || ';' || v_name ||
                         '���ڸ�����');
  end if;
end;













