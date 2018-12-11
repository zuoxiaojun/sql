--merge�÷�����
--mergeʹ�ó��������ھ͸��£������ھͲ���

--���Գ��� ��t2������ݰ�������ƥ����µ�t1���У����ھ͸��£������ھͲ���
--����ģ������
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

--���ھ͸��£������ھͲ���
merge into t1 
using t2
on (t1.name=t2.name)
when matched then
  update 
  set  t1.sal=t2.sal
when not matched then
  insert values(t2.name,t2.sal);  

--update��insert����Ҳ��ֻ������һ
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

--�ɶ�merge����������

merge into t1
using t2
on (t1.name = t2.name)
when matched then
  update set t1.sal = t2.sal where t1.name = 'a'

--����delete�Ӿ������
merge into t1
using t2
on(t1.name=t2.name)
when matched then
  update set t1.sal=t1.sal+t2.sal
  delete where (t1.name='b')

select * from t1

--�ɲ�����������ʽinsert
 merge into t1
 using t2
 on (1 = 2)  --�Ǻ������
 when not matched then
   insert values (t2.name, t2.sal)

--ע��  on ������ֵ��Դ�����Ψһ������ᱨ��  ORA-30926 �޷���Դ���л��һ���ȶ�����
--delete��where��������д�����
merge into t1
using t2
on (t1.name = t2.name)
when matched then
  update
     set t1.sal = t1.sal + t2.sal
   where t1.name = 'f' 
   delete where (t1.name = 'b')

--���ã���test����id=1��nameֵ��Ϊid=2��nameֵ��id=2��nameֵ��Ϊid=1��ֵ
create table test (
id number,
name varchar2(20))

select * from test;
insert into test values('1','a');
insert into test values('2','b')

--���������ݱ�
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
  
  
  --����ͼ����Ҳ��
  merge into t1
  using v_t2
  on (t1.name = v_t2.name)
  when matched then
    update set t1.sal = t1.sal + v_t2.sal
  when not matched then
    insert values (v_t2.name, v_t2.sal)
      


