/*  2017-12-03  */

select * from employees;
--group by
select department_id, avg(salary)
  from employees
 where department_id is not null
 group by department_id;

select max(salary) Maximum,
       min(salary) Minimum,
       sum(salary) Sum,
       round(avg(salary),0) Average
  from employees
 -- order by round(maximum);
 
 select a.first_name, a.department_id, b.department_name
   from employees a
   left join departments b
     on a.department_id = b.department_id;
     
     SELECT last_name, salary
FROM   employees
WHERE  salary >
               (SELECT salary
                FROM   employees
                WHERE  last_name = 'Abel');


SELECT last_name, job_id, salary
  FROM employees
 WHERE job_id in (SELECT job_id FROM employees WHERE last_name = 'Taylor')
   AND salary>any (SELECT salary FROM employees WHERE last_name = 'Taylor');

SELECT * FROM departments
WHERE  EXISTS
(SELECT * FROM employees
WHERE employees.department_id=departments.department_id);








