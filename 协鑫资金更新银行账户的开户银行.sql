select code, name from bd_asslinenum  --����������Ϣ

select code,name from bd_asslinenum --����������Ϣ


select count(*) from bd_bankdoc  --����

--���б��볤�Ȳ�����12λ��
select pk_bankdoc, code, name
  from bd_bankdoc
 where length(code) <> 12

  
 
 /*��ѯ�����˻��������˱��볤�Ȳ�����12λ�����е�����*/
select a.pk_bankaccbas, a.accname, a.accnum, a.pk_bankdoc, b.name
  from bd_bankaccbas a
  left join bd_bankdoc b
    on a. pk_bankdoc = b. pk_bankdoc
 where a.pk_bankdoc in
       (select pk_bankdoc from bd_bankdoc where length(code) <> 12)
   and a.dr = 0
   and a.accclass =2  --�˻�����
   
   
   create or replace view v_bank_notin as 
 select a.pk_bankdoc
   from bd_bankaccbas a
   left join bd_bankdoc b
     on a. pk_bankdoc = b. pk_bankdoc
  where a.pk_bankdoc in
        (select pk_bankdoc from bd_bankdoc where length(code) <> 12)
    and a.dr = 0
    and a.accclass = 2
    
    
    select pk_bankdoc, code, name from bd_bankdoc
    
    
   --�����޸��м����ݱ���¼��ȷ�������˻�������ֵ 
    create table yhdata (
    PK_BANKACCBAS varchar2(255),
    ACCNAME varchar2(255),
    ACCNUM varchar2(255),
    new_PK_BANKDOC varchar2(20)  
    
    )
    ;
   select * from  yhdata;
    
   
   --���������˻��Ŀ�������ֵ
   merge into bd_bankaccbas a
   using yhdata b
   on (a.PK_BANKACCBAS = b.PK_BANKACCBAS)--���������˻�pkƥ��
   when matched then
     update set a.pk_bankdoc = b.new_pk_bankdoc
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
