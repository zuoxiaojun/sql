
   --null语句
   select * from employees
   
   declare
     v_sal  employees.sal%type;
     v_name employees.name%type;
     x      employees.code%type;
   begin 
     select name, sal into v_name, v_sal from employees where code = '&no';
     if v_sal < 6000 then
       update employees
          set sal = nvl(sal, 0) + sal * 0.2
        where name = v_name;
       commit;
       dbms_output.put_line(v_name || '的奖金更新了');
     else
       null;
     end if;  
   end;
   

