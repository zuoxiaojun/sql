--1、编写一个查询，使其显示当前日期，将列名为为Date
select sysdate "Date" from dual;
--2、显示每位员工的编号、姓氏、薪金和增加15%薪金之后薪金值（并将该列命名为New Salary）不允许输出的结果中有空值
select employee_id,
       first_name,
       nvl(salary, 0),
       nvl(salary, 0) * 1.15 "New Salary"from employees
--3
select employee_id,
       first_name,
       nvl(salary, 0),
       nvl(salary, 0) * 1.15 "New Salary" ,nvl(salary, 0) * 0.15 "Increase"from employees
--4
select first_name, length(first_name) + length(last_name) "namelength"
  from employees
 where first_name like 'J%'
    or first_name like 'A%'
    or first_name like 'M%'
--5
select first_name, round(months_between(sysdate, hire_date), 0) "month_worked",hire_date
  from employees order by hire_date
  --6
  select first_name || '现在的薪水是$'|| salary ||'每月 '||'他期望他能拿到每月$'|| salary*3 "Dream Salaries"from employees
  --7
  select upper(first_name), lpad(substr(salary, 1, 15), 15, '$')--lapd  左侧补齐，rpad 右侧补齐
    from employees
--8
select first_name,hire_date from employees 
--9
select first_name form,hire_date,to_char(hire_date,'day') "Day" from employees order by to_char(hire_date,'day')
--10
select first_name,
       case
         when commission_pct is null then
          'No Commission'
         else
          to_char('0'||commission_pct)
       end
  from employees
  
  --12
  
  select job_id job,
         decode(job_id,
                'AD_PRES',
                'A',
                'ST_MAN',
                'B',
                'IT_PROG',
                'C',
                'SA_REP',
                'D',
                'ST_CLERK',
                'E',
                'O') grade
    from jobs
    --13
select job_id job,
       case   job_id 
        when 'AD_PRES'   then 'A'
       when 'ST_MAN'   then 'B'
       when 'IT_PROG'   then 'C'
       when 'SA_REP'   then 'D'  
          else 'O'
         end   grade
  from employees order by grade





