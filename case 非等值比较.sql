

--case 非等值比较
declare
  v_sal          employees.sal%type;
  v_code      employees.code%type := &no;
begin
  select sal into v_sal from employees where code = &no;
 case
    when v_sal < 1500 then
      update employees set sal = sal + 1000 where code = &no;
    when v_sal < 6000 then
      update employees set sal = sal + 2000 where code = &no;
      commit;
  end case;
end;
