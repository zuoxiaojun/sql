--merge用法测试
--merge使用场景，存在就更新，不存在就插入

--测试场景 从t2表的数据按照名称匹配更新到t1表中，存在就更新，不存在就插入
--创建模拟数据
create table t1 (
name varchar2(255),
sal     varchar2(255)
);

create table t2 (
name varchar2(255),
sal     varchar2(255)
);

select * from t1 ;
select * from t2  for update 

insert into t1 values('d','545');

--存在就更新，不存在就插入
merge into t1 
using t2
on (t1.name=t2.name)
when matched then
  update 
  set  t1.sal=t2.sal
when not matched then
  insert values(t2.name,t2.sal);  

--update和insert动作也可只出现其一
--update
merge into t1
using t2
on(t1.name=t2.name)
when matched then
  update
  set t1.sal=t2.sal  ;

--insert 

merge into t1
using t2
on (t1.name = t2.name)
when not matched then
  insert values (t2.name, t2.sal)

--可对merge加条件控制

merge into t1
using t2
on (t1.name = t2.name)
when matched then
  update set t1.sal = t2.sal where t1.name = 'a'

--可用delete子句清除行
merge into t1
using t2
on(t1.name=t2.name)
when matched then
  update set t1.sal=t1.sal+t2.sal
  delete where (t1.name='b')

select * from t1

--可采用无条件方式insert
 merge into t1
 using t2
 on (1 = 2)  --非恒等条件
 when not matched then
   insert values (t2.name, t2.sal)

--注意  on 条件的值在源表必须唯一，否则会报错  ORA-30926 无法在源表中获得一组稳定的行
--delete的where条件必须写在最后
merge into t1
using t2
on (t1.name = t2.name)
when matched then
  update
     set t1.sal = t1.sal + t2.sal
   where t1.name = 'f' 
   delete where (t1.name = 'b')

--妙用，将test表中id=1的name值改为id=2的name值，id=2的name值改为id=1的值
create table test (
id number,
name varchar2(20))

select * from test;
insert into test values('1','a');
insert into test values('2','b')

--构造新数据表
select 1 id, (select name from test where id = 2) name from dual
union all
select 2 id,(select name from test where id=1) name from dual

merge into test
using (select 1 id, (select name from test where id = 2) name
         from dual
       union all
       select 2 id, (select name from test where id = 1) name
         from dual) t
on (test.id = t.id)
when matched then
  update set test.name = t.name;
  
  select *  from test --for update
  
  create view v_t2 as select * from t2
  
  
  --从视图更新也可
  merge into t1
  using v_t2
  on (t1.name = v_t2.name)
  when matched then
    update set t1.sal = t1.sal + v_t2.sal
  when not matched then
    insert values (v_t2.name, v_t2.sal)
      


