--��Ӧ���Ż��ӿڴ������ݼ�¼
create or replace view v_mh_record as(
select a.file_id, a.pk_bill, a.ts, b.code, b.name, b.creator, b.pk_supplier
  from xx_idcontrast a, bd_supplier b
 where a.pk_bill = b.pk_supplier
   and a.ts > '2019-06-26 00:00:00');

--�޸Ĺ�Ӧ�̴�����Ϊ"�Ż�"
update bd_supplier
   set creator =
       (select cuserid from sm_user where user_code = 'gysmh')  --1001D110000000HDB82W
 where creator in ('#UAP#', '~');
 
 --Ĭ��ֵ��Ӧ�̵����ϵ����������Ϣ
update bd_supplier
   set def4 = '-',
       def5 = '-',
       def6 = '1001D110000000DH1R7P',
       def7 = '1001D110000000AGJSFY'
 where def4 = '~'
;

--�����洢����
create or replace procedure udpate_bd_supplier_creator is
begin
  update bd_supplier
     set creator =
         (select cuserid from sm_user where user_code = 'gysmh')
   where creator in ('#UAP#', '~');--������
  commit;
  update bd_supplier
     set def4 = '-',
         def5 = '-',
         def6 = '1001D110000000DH1R7P',
         def7 = '1001D110000000AGJSFY'
   where def4 = '~';--������Ϣ
  commit;
  update bd_supplier
     set mnecode = substr(mnecode, 1, 4)
   where code in (select code from v_mh_record)
     and length(mnecode) <> 4;--������
  commit;
end;


select * from user_jobs;


select def1 from  bd_supplier where name='�Ϻ���˿�������Ʒ���޹�˾'  --1001D110000000HIP1OR

select * from bd_defdoc where name = '�Ż��ϸ�'--1001D110000000HIP1OR

update bd_supplier
   set def1 = '1001D110000000HIP1OR'
 where code in (select code from v_mh_record)
   and def1 is null

