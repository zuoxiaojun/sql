
--goto���
declare
 v_cnt int :=1;
 begin
   loop 
     dbms_output.put_line(v_cnt);
     if v_cnt = 10 then
       goto end_loop;
       end if;
       v_cnt :=v_cnt+1;
       end loop;
       <<end_loop>>
       dbms_output.put_line('ѭ������');
   end;
    
   
   
   --null���
   select * from employees
   
   declare
     v_sal  employees.sal%type;
     v_name employees.name%type;
   begin
     select name, sal into v_name, v_sal from employees where code = '&no';
     if v_sal < 6000 then
       update employees
          set sal = nvl(sal, 0) + sal * 0.2
        where name = v_name;
       commit;
       dbms_output.put_line(v_name || '�Ľ��������');
     else
       null;
     end if;
   end;
   
   
   
   
   
   
   
   
   
   
