--1����дһ����ѯ��ʹ����ʾ��ǰ���ڣ�������ΪΪDate
select sysdate "Date" from dual;
--2����ʾÿλԱ���ı�š����ϡ�н�������15%н��֮��н��ֵ��������������ΪNew Salary������������Ľ�����п�ֵ
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
  select first_name || '���ڵ�нˮ��$'|| salary ||'ÿ�� '||'�����������õ�ÿ��$'|| salary*3 "Dream Salaries"from employees
  --7
  select upper(first_name), lpad(substr(salary, 1, 15), 15, '$')--lapd  ��ಹ�룬rpad �Ҳಹ��
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





