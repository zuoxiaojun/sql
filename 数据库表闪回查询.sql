--���ݿ�����ز�ѯ

delete from  htxz

select * from htxz
--���ز�ѯ
select *
  from htxz as of timestamp to_timestamp('2019-05-24 14:50:00', 'yyyy-mm-dd hh24:mi:ss');
  
--���ز���ǰ�������ƶ����ܣ������ò��������أ�

alter table htxz enable row movement;

--ִ���������
flashback table htxz to timestamp TO_TIMESTAMP('2019-05-24 14:50:00', 'yyyy-mm-dd hh24:mi:ss');
