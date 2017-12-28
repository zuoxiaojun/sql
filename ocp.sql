select * from employees;

  select last_name, first_name
          from employees
         where first_name like '__a%';

select last_name, job_id from employees where manager_id is null;

select first_name, last_name
  from employees
 where first_name like '%e%'
    or first_name like '%a%';

select *
  from employees
 where job_id in ('SA_REP', 'ST_CLERK')
   and salary not in ('2500', '3500', '7000');
