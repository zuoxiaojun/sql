select * from user_tables

select * from employees  for update 


--引用型变量
declare
  v_code employees.code%type;
  v_name employees.name%type;
  v_sal  employees.sal%type;
begin
  select code, name, sal
    into v_code, v_name, v_sal
    from employees
   where code = &num1;
  dbms_output.put_line(v_code || '的工资为：' || v_sal);
end;


--if条件分支

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
    dbms_output.put_line(v_name || '的工资为：' || v_sal);
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
    dbms_output.put_line(v_name || '的新工资为：' || v_sal);
  else
    dbms_output.put_line(v_name || '的工资为：' || v_sal);
  end if;
end;

--if 多重分支

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
    dbms_output.put_line(v_name || '的工资为：' || v_sal || ';' || v_name ||
                         '属于低收入');
  else
    v_sal <(5000) then dbms_output.put_line(v_name || '的工资为：' || v_sal || ';' ||
                                            v_name || '属于中收入');
  else
    dbms_output.put_line(v_name || '的工资为：' || v_sal || ';' || v_name ||
                         '属于高收入');
  end if;
end;













