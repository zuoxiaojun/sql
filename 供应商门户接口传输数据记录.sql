--供应商门户接口传输数据记录
select a.file_id, a.pk_bill, a.ts, b.code, b.name, b.creator, b.pk_supplier
  from xx_idcontrast a, bd_supplier b
 where a.pk_bill = b.pk_supplier
   and a.ts > '2019-05-17 00:55:44';

--修改供应商创建人为"门户"
update bd_supplier
   set creator =
       (select cuserid from sm_user where user_code = 'gysmh')
 where creator in ('#UAP#', '~');
 
 --默认值供应商档案上的银行相关信息
update bd_supplier
   set def4 = '-',
       def5 = '-',
       def6 = '1001D110000000DH1R7P',
       def7 = '1001D110000000AGJSFY'
 where def4 = '~'
;

--创建存储过程
create or replace procedure udpate_bd_supplier_creator is 
begin
  update bd_supplier
   set creator =
       (select cuserid from sm_user where user_code = 'gysmh')
 where creator in ('#UAP#', '~');
 commit;
 update bd_supplier
   set def4 = '-',
       def5 = '-',
       def6 = '1001D110000000DH1R7P',
       def7 = '1001D110000000AGJSFY'
 where def4 = '~';
 commit;
  end;


select * from user_jobs;




